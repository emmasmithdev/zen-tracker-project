require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/country.rb')
require_relative('../models/continent.rb')

get '/countries' do
  @countries = Country.all
  erb(:"countries/index")
end

# sort by visited/not visited
post '/countries/visited' do
  if params["sort-countries"] == "all"
    @countries = Country.all
  elsif params["sort-countries"] == "visited"
    @countries = Country.visited
  elsif params["sort-countries"] == "not-visited"
    @countries = Country.not_visited
  end
  erb(:"countries/index")
end

# add a country
get '/countries/new' do
  @continents = Continent.all
  erb(:"countries/new")
end

get '/countries/:id' do
  @country = Country.find(params["id"].to_i)
  erb(:"countries/show")
end

post '/countries' do
  @country = Country.new(params)
  @country.save
  redirect "/countries"
end

#update visited
post '/countries/:id' do
  id = params["id"].to_i
  @country = Country.find(id)
  @country.update_visited
  erb(:"countries/show")
end
