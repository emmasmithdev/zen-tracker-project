require_relative('../db/sql_runner.rb')
require_relative('city.rb')

class Country

  attr_reader :id, :name, :continent_id, :image_url
  attr_accessor :visited

  def initialize(options)
    @id = options["id"] if options["id"]
    @name = options["name"]
    @visited = options["visited"]
    @continent_id = options["continent_id"]
    @image_url = options["image_url"]
  end

  def save
    sql = "INSERT INTO countries (name, visited, continent_id, image_url)
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @visited, @continent_id, @image_url]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all
    sql = "SELECT*FROM countries"
    countries = SqlRunner.run(sql)
    countries.map { |country| Country.new(country)}
  end

  def self.delete_all
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end

  def self.visited
    sql = 'SELECT*FROM countries WHERE visited = $1'
    values = ["t"]
    countries = SqlRunner.run(sql, values)
    countries.map { |country| Country.new(country)}
  end

  def self.not_visited
    sql = 'SELECT*FROM countries WHERE visited = $1'
    values = ["f"]
    countries = SqlRunner.run(sql, values)
    countries.map { |country| Country.new(country)}
  end

  def continent
    sql = "SELECT*FROM continents WHERE id = $1"
    values = [@continent_id]
    result = SqlRunner.run(sql, values)
    return Continent.new(result[0])
  end

  def update_visited
    @visited = "t"
    sql = "UPDATE countries SET visited = $1 WHERE id = $2"
    values = [@visited, @id]
    SqlRunner.run(sql, values)
    continent = self.continent
    continent.update_visited
  end

  def cities
    sql = "SELECT*FROM cities WHERE country_id = $1"
    values = [@id]
    cities = SqlRunner.run(sql, values)
    cities.map { |city| City.new(city)}
  end

  def self.find(id)
    sql = 'SELECT*FROM countries WHERE id = $1'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Country.new(results[0])
  end

end
