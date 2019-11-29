require_relative('../db/sql_runner')

class Yoga

  attr_reader :id, :type, :description

  def initialize(options)
    @id = options["id"] if options["id"]
    @type = options["type"]
    @description = options["description"]
  end

  def save
    sql = "INSERT INTO yogas (type, description)
    VALUES ($1, $2) RETURNING id"
    values = [@type, @description]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

end
