require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/yoga.rb')
also_reload('../models/*')

get '/yogas' do
  @yogas = Yoga.all
  erb(:"yogas/index")
end

get '/yogas/:id' do
  @yoga = Yoga.find(params["id"].to_i)
  erb(:"yogas/show")
end
