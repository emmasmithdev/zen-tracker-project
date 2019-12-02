require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/continent.rb')
also_reload('../models/*')

get '/continents' do
  @continents = Continent.all
  erb (:'continents/index')
end

#sort by visited/not visited
post '/continents/visited' do
  if params["sort-continents"] == "all"
    @continents = Continent.all
  elsif params["sort-continents"] == "visited"
    @continents = Continent.visited
  elsif params["sort-continents"] == "not-visited"
    @continents = Continent.not_visited
  end
  erb(:"continents/index")
end

get '/continents/:id' do
  @continent = Continent.find(params["id"].to_i)
  erb(:"continents/show")
end

#update visited
post '/continents/:id' do
  id = params["id"].to_i
  @continent = Continent.find(id)
  @continent.update_visited
  erb(:"continents/show")
end
