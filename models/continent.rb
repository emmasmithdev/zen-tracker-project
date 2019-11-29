require_relative('../db/sql_runner.rb')
require_relative('country.rb')

class Continent

  attr_reader :id, :name, :size
  attr_accessor :visited

  def initialize(options)
    @id = options["id"] if options["id"]
    @name = options["name"]
    @visited = options["visited"]
    @size = options["size"]
  end

  def save
    sql = "INSERT INTO continents (name, visited, size)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @visited, @size]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all
    sql = "SELECT*FROM continents"
    continents = SqlRunner.run(sql)
    continents.map { |continent| Continent.new(continent)}
  end

  def self.delete_all
    sql = "DELETE FROM continents"
    SqlRunner.run(sql)
  end

  def self.sort_ascending
    sql = "SELECT*FROM continents ORDER BY size ASC"
    continents = SqlRunner.run(sql)
    continents.map { |continent| Continent.new(continent)}
  end

  def self.sort_descending
    sql = "SELECT*FROM continents ORDER BY size DESC"
    continents = SqlRunner.run(sql)
    continents.map { |continent| Continent.new(continent)}
  end

  def self.visited
    sql = "SELECT*FROM continents WHERE visited = $1"
    values = ["t"]
    continents = SqlRunner.run(sql, values)
    continents.map { |continent| Continent.new(continent)}
  end

  def self.not_visited
    sql = "SELECT*FROM continents WHERE visited = $1"
    values = ["f"]
    continents = SqlRunner.run(sql, values)
    continents.map { |continent| Continent.new(continent)}
  end

  def update_visited
    @visited = "t"
    sql = "UPDATE continents SET visited = $1 WHERE id = $2"
    values = [@visited, @id]
    SqlRunner.run(sql, values)
  end

  def countries
    sql = "SELECT*FROM countries WHERE continent_id = $1"
    values = [@id]
    countries = SqlRunner.run(sql, values)
    countries.map { |country| Country.new(country)}
  end

  def self.find(id)
    sql = 'SELECT*FROM continents WHERE id = $1'
    values = [id]
    results = SqlRunner.run(sql, values)
    return Continent.new(results[0])
  end

  def cities
    countries = self.countries
    cities = countries.map { |country| country.cities }
    cities.flatten
  end

end
