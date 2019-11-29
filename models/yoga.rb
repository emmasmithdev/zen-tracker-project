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

  def self.delete_all
    sql = "DELETE FROM yogas"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT*FROM yogas"
    yogas = SqlRunner.run(sql)
    yogas.map { |yoga| Yoga.new(yoga)}
  end

  def self.find(id)
    sql = "SELECT*FROM yogas WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Yoga.new(result[0])
  end

end
