require_relative('../db/sql_runner')

class YogaExperience

  attr_reader :id, :studio_name, :city_id, :yoga_id, :description
  attr_accessor :bucket_list, :visited

  def initialize(options)
    @id = options["id"] if options["id"]
    @studio_name = options["studio_name"]
    @city_id = options["city_id"]
    @yoga_id = options["yoga_id"]
    @description = options["description"]
    @bucket_list = options["bucket_list"]
    @visited = options["visited"]
  end

  def save
    sql = "INSERT INTO yoga_experiences
    (studio_name, city_id, yoga_id, description, bucket_list, visited)
    VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@studio_name, @city_id, @yoga_id, @description, @bucket_list, @visited]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM yoga_experiences"
    SqlRunner.run(sql)
  end

  def add_to_bucket_list
    @bucket_list = "t"
    sql = "UPDATE yoga_experiences SET bucket_list = $1 WHERE id = $2"
    values = [@bucket_list, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT*FROM yoga_experiences WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    YogaExperience.new(result[0])
  end

  def self.bucket_list
    sql = "SELECT*FROM yoga_experiences WHERE bucket_list = $1"
    values = ["t"]
    results = SqlRunner.run(sql, values)
    results.map { |experience| YogaExperience.new(experience)}
  end

  def self.visited
    sql = "SELECT*FROM yoga_experiences WHERE visited = $1"
    values = ["t"]
    results = SqlRunner.run(sql, values)
    results.map { |experience| YogaExperience.new(experience)}
  end

  def self.not_visited
    sql = "SELECT*FROM yoga_experiences WHERE visited = $1"
    values = ["f"]
    results = SqlRunner.run(sql, values)
    results.map { |experience| YogaExperience.new(experience)}
  end

  def city
    sql = "SELECT*FROM cities WHERE id = $1"
    values = [@city_id]
    result = SqlRunner.run(sql, values)
    return City.new(result[0])
  end

  def update_visited
    @visited = "t"
    sql = "UPDATE yoga_experiences SET visited = $1 WHERE id = $2"
    values = [@visited, @id]
    SqlRunner.run(sql, values)
    city = self.city
    city.update_visited 
  end

end
