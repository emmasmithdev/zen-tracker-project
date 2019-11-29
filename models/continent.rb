require_relative('../db/sql_runner.rb')

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

end
