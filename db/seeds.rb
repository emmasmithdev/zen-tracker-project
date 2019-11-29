require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/yoga.rb')
require_relative('../models/yoga_experience.rb')
require_relative('../models/attraction.rb')
require('pry')

Country.delete_all
Continent.delete_all

continent1 = Continent.new({"name" => "Asia", "visited" => "f", "size" => 45000000})
continent2 = Continent.new({"name" => "Africa", "visited" => "f", "size" => 30000000})
continent3 = Continent.new({"name" => "North America", "visited" => "f", "size" => 25000000})
continent4 = Continent.new({"name" => "South America", "visited" => "f", "size" => 18000000})
continent5 = Continent.new({"name" => "Antarctica", "visited" => "f", "size" => 14000000})
continent6 = Continent.new({"name" => "Europe", "visited" => "f", "size" => 10000000})
continent7 = Continent.new({"name" => "Australia", "visited" => "f", "size" => 9000000})

continent1.save
continent2.save
continent3.save
continent4.save
continent5.save
continent6.save
continent7.save

country1 = Country.new({"name" => "Thailand", "visited" => "f", "continent_id" => continent1.id})
country2 = Country.new({"name" => "India", "visited" => "f", "continent_id" => continent1.id})
country3 = Country.new({"name" => "Cambodia", "visited" => "f", "continent_id" => continent1.id})

country1.save
country2.save
country3.save

city1 = City.new({"name" => "Bangkok", "visited" => "f", "country_id" => country1.id, "map_url" => "../public/images/bangkok.jpg", "distance" => 9632})
city2 = City.new({"name" => "Delhi", "visited" => "f", "country_id" => country2.id, "map_url" => "../public/images/delhi.jpg", "distance" => 6875})
city3 = City.new({"name" => "Phnom Penh", "visited" => "f", "country_id" => country3.id, "map_url" => "../public/images/phnomh_penh.jpg", "distance" => 10096})

city1.save
city2.save
city3.save

binding.pry
nil
