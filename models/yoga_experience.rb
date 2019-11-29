require_relative('../db/sql_runner')

class YogaExperience

  attr_reader :id, :studio_name, :city_id, :yoga_id, :description
  attr_accessor :bucket_list

  def initialize(options)
    @id = options["id"] if options["id"]
    @studio_name = options["studio_name"]
    @city_id = options["city_id"]
    @yoga_id = options["yoga_id"]
    @description = options["description"]
    @bucket_list = options["bucket_list"]
  end

  def save
    sql = "INSERT INTO yoga_experiences
    (studio_name, city_id, yoga_id, description, bucket_list)
    VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@studio_name, @city_id, @yoga_id, @description, @bucket_list]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

end
