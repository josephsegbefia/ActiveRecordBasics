# This is where you can create initial data for your app.
# require 'faker'

# puts "Creating restaurants"
# 100.times do |i|
#   restaurant = Restaurant.new(name: Faker::Restaurant.name, address: Faker::Address.street_name)
#   restaurant.save!
#   puts "created #{i} restaurant "
# end

# puts "All done"


require 'json'
require "rest-client"

response = RestClient.get "https://api.github.com/users/lewagon/repos"
repos = JSON.parse(response)

repos.each do |repo|
  restaurant = Restaurant.new(name: repo['name'])
  restaurant.save
end
