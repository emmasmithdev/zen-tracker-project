require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/city.rb')
require_relative('../models/country.rb')

get '/cities' do
  @cities = City.all
  erb(:"cities/index")
end

# sort by visited/not visited
post '/cities/visited' do
  if params["sort-cities"] == "all"
    @cities = City.all
  elsif params["sort-cities"] == "visited"
    @cities = City.visited
  elsif params["sort-cities"] == "not-visited"
    @cities = City.not_visited
  end
  erb(:"cities/index")
end

# add a city
get '/cities/new' do
  @countries = Country.all
  erb(:"cities/new")
end

get '/cities/:id' do
  @city = City.find(params["id"].to_i)
  erb(:"cities/show")
end

post '/cities' do
  @city = City.new(params)
  @city.save
  redirect "/cities"
end

#update visited
post '/cities/:id' do
  id = params["id"].to_i
  @city = City.find(id)
  @city.update_visited
  erb(:"cities/show")
end
