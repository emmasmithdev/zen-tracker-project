require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/yoga.rb')
require_relative('../models/yoga_experience.rb')
require_relative('../models/attraction.rb')
require('pry')

City.delete_all
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

yoga1 = Yoga.new({"type" => "Hatha", "description" => "Hatha yoga is a generic term that refers to any type of yoga that teaches physical postures.
  When a class is marketed as Hatha, it generally means that you will get a gentle introduction to the most basic yoga postures.
  You probably won't work up a sweat in a hatha yoga class, but you should end up leaving class feeling longer, looser, and more relaxed."})
yoga2 = Yoga.new({"type" => "Bikram", "description" => "About 30 years ago, Bikram Choudhury developed this school of yoga where classes are held in artificially heated rooms.
  In a Bikram class, you will sweat like never before as you work your way through a series of 26 poses."})
yoga3 = Yoga.new({"type" => "Ashtanga", "description" => "Ashtanga is based on ancient yoga teachings. It's a rigorous style of yoga that follows a specific sequence of postures and is similar to vinyasa yoga,
  as each style links every movement to a breath. The difference is that Ashtanga always performs the exact same poses in the exact same order."})
yoga4 = Yoga.new({"type" => "Vinyasa", "description" => "Vinyasa is a Sanskrit word for a phrase that roughly translates as \"to place in a special way\", referring—in hatha yoga—to a sequence of poses.
  Vinyasa classes are known for their fluid, movement-intensive practices. Vinyasa teachers sequence their classes to smoothly transition from pose to pose, with the intention of linking breath to movement,
  and often play music to keep things lively."})

yoga1.save
yoga2.save
yoga3.save
yoga4.save 

binding.pry
nil
