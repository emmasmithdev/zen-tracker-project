require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/yoga_experience.rb')
also_reload('../models/*')

get '/yoga-experiences' do
  @experiences = YogaExperience.all
  erb(:"yoga_experiences/index")
end

get '/yoga-experiences/:id' do
  @experience = YogaExperience.find(params["id"].to_i)
  erb(:"yoga_experiences/show")
end

# update bucket list
post '/yoga-experiences/:id' do
  id = params["id"].to_i
  @experience = YogaExperience.find(id)
  if @experience.bucket_list == "f"
    @experience.add_to_bucket_list
  elsif @experience.bucket_list == "t"
    @experience.remove_from_bucket_list
  end
  erb(:"yoga_experiences/show")
end
