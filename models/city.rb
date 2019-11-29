require_relative('../db/sql_runner.rb')

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


end
