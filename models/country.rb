require_relative('../db/sql_runner.rb')

class Country

  attr_reader :id, :name, :continent_id
  attr_accessor :visited

  def initialize(options)
    @id = options["id"] if options["id"]
    @name = options["name"]
    @visited = options["visited"]
    @continent_id = options["continent_id"]
  end

  def save
    sql = "INSERT INTO countries (name, visited, continent_id)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @visited, @continent_id]
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

end
