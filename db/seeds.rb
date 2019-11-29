require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/yoga.rb')
require_relative('../models/yoga_experience.rb')
require_relative('../models/attraction.rb')
require('pry')

Continent.delete_all

@continent1 = Continent.new({"id" => 1,"name" => "Asia", "visited" => "f", "size" => 45000000})
@continent2 = Continent.new({"id" => 2,"name" => "Africa", "visited" => "f", "size" => 30000000})
@continent3 = Continent.new({"id" => 3,"name" => "North America", "visited" => "f", "size" => 25000000})
@continent4 = Continent.new({"id" => 4,"name" => "South America", "visited" => "f", "size" => 18000000})
@continent5 = Continent.new({"id" => 5,"name" => "Antarctica", "visited" => "f", "size" => 14000000})
@continent6 = Continent.new({"id" => 6,"name" => "Europe", "visited" => "f", "size" => 10000000})
@continent7 = Continent.new({"id" => 7,"name" => "Australia", "visited" => "f", "size" => 9000000})

@continent1.save
@continent2.save
@continent3.save
@continent4.save
@continent5.save
@continent6.save
@continent7.save

@country1 = Country.new({"id" => 1, "name" => "Thailand", "visited" => "f", "continent_id" => @continent1.id})
@country2 = Country.new({"id" => 2, "name" => "India", "visited" => "f", "continent_id" => @continent1.id})
@country3 = Country.new({"id" => 3, "name" => "Cambodia", "visited" => "f", "continent_id" => @continent1.id})

@country1.save
@country2.save
@country3.save

binding.pry
nil
