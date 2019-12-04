require_relative('../db/sql_runner.rb')
require_relative('country.rb')
require_relative('yoga.rb')

class City

  attr_reader :id, :name, :country_id, :map_url, :distance, :image_url
  attr_accessor :visited

  def initialize(options)
    @id = options["id"] if options["id"]
    @name = options["name"]
    @visited = options["visited"]
    @country_id = options["country_id"]
    @map_url = options["map_url"]
    @distance = options["distance"]
    @image_url = options["image_url"]
  end

  def save
    sql = "INSERT INTO cities (name, visited, country_id, map_url, distance, image_url)
    VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@name, @visited, @country_id, @map_url, @distance, @image_url]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT*FROM cities"
    cities = SqlRunner.run(sql)
    cities.map { |city| City.new(city)}
  end

  def self.visited
    sql = 'SELECT*FROM cities WHERE visited = $1'
    values = ["t"]
    countries = SqlRunner.run(sql, values)
    countries.map { |city| City.new(city)}
  end

  def self.not_visited
    sql = 'SELECT*FROM cities WHERE visited = $1'
    values = ["f"]
    countries = SqlRunner.run(sql, values)
    countries.map { |city| City.new(city)}
  end

  def country
    sql = "SELECT*FROM countries WHERE id = $1"
    values = [@country_id]
    result = SqlRunner.run(sql, values)
    return Country.new(result[0])
  end

  def continent
    country = self.country
    country.continent
  end

  def self.find(id)
    sql = "SELECT*FROM cities WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return City.new(result[0])
  end

  def update_visited
    @visited = "t"
    sql = "UPDATE cities SET visited = $1 WHERE id = $2"
    values = [@visited, @id]
    SqlRunner.run(sql, values)
    country = self.country
    country.update_visited
  end

  def self.sort_by_distance
    sql = "SELECT*FROM cities ORDER BY distance ASC"
    cities = SqlRunner.run(sql)
    cities.map { |city| City.new(city)}
  end

  def yoga
    sql = "SELECT y.* FROM yogas y INNER JOIN yoga_experiences
    ON yoga_experiences.yoga_id = y.id WHERE yoga_experiences.city_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values).uniq
    results.map { |yoga| Yoga.new(yoga)}
  end

  def self.search(name)
    sql = "SELECT*FROM cities WHERE name = $1"
    values = [name]
    result = SqlRunner.run(sql, values)
    return City.new(result[0])
  end

end
