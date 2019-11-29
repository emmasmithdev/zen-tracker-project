require_relative('../db/sql_runner.rb')
require_relative('country.rb')

class City

  attr_reader :id, :name, :country_id, :map_url, :distance
  attr_accessor :visited

  def initialize(options)
    @id = options["id"] if options["id"]
    @name = options["name"]
    @visited = options["visited"]
    @country_id = options["country_id"]
    @map_url = options["map_url"]
    @distance = options["distance"]
  end

  def save
    sql = "INSERT INTO cities (name, visited, country_id, map_url, distance)
    VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@name, @visited, @country_id, @map_url, @distance]
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

end
