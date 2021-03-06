require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('controllers/continents_controller')
require_relative('controllers/countries_controller')
require_relative('controllers/cities_controller')
require_relative('controllers/yogas_controller')
require_relative('controllers/yoga_experiences_controller')
require_relative('controllers/bucket_list_controller')
require_relative('models/city.rb')

get '/' do
  erb(:"index")
end

post'/' do
  # If destination is a continent
  # Call search function on Continent class
  # If destination is a country
  # Call search function on Country class
  # If destination is a city:
  result = City.search(params["name"])
  if result != nil
    @city = result
    erb(:"cities/show")
  else
    redirect '/'
  end
end
