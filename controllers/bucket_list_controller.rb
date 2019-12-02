require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/continent.rb')
require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/yoga.rb')
require_relative('../models/yoga_experience.rb')
also_reload('../models/*')

get '/bucket-list' do
  @continents = Continent.all
  @countries = Country.all
  @cities = City.all
  @experiences = YogaExperience.all
  erb(:"bucket_list/index")
end
