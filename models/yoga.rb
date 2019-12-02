require_relative('../db/sql_runner')
require_relative('city.rb')
require_relative('yoga_experience.rb')

class Yoga

  attr_reader :id, :type, :description, :image_url
  attr_accessor :practises

  def initialize(options)
    @id = options["id"] if options["id"]
    @type = options["type"]
    @description = options["description"]
    @practises = 0
    @image_url = options["image_url"]
  end

  def save
    sql = "INSERT INTO yogas (type, description, image_url)
    VALUES ($1, $2, $3) RETURNING id"
    values = [@type, @description, @image_url]
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

  def update_practises
    @practises += 1
    sql = "UPDATE yogas SET practises = $1 WHERE id = $2"
    values = [@practises, @id]
    SqlRunner.run(sql, values)
  end

  def cities
    sql = "SELECT c.* FROM cities c INNER JOIN yoga_experiences y
    ON y.city_id = c.id WHERE y.yoga_id = $1"
    values =[@id]
    results = SqlRunner.run(sql, values)
    results.map { |city| City.new(city)}
  end

  def experiences
    sql = "SELECT*FROM yoga_experiences WHERE yoga_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    results.map { |experience| YogaExperience.new(experience)}
  end

end
