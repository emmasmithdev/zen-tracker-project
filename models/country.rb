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

end
