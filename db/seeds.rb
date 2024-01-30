# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Clean database"
Camera.destroy_all

puts "Creating seeds"

user = User.create!(email: "owner@mail.com", password: "123456")

nikon = {name: "Nikon fm2n", details: "A great film camera from the 80s", category: "Film cameras", price: 20.00, year: 1987, model: "fm2n", user: user}
canon = {name: "Canon AE", details: "A great film camera from the 90s", category: "Film cameras", price: 20.00, year: 1982, model: "AE", user: user}
minolta = {name: "Minolta SR", details: "A great film camera from the 80s", category: "Film cameras", price: 20.00, year: 1985, model: "SR", user: user }


[nikon, canon, minolta].each do |attributes|
  camera = Camera.create!(attributes)
  puts "Created #{camera.name}"
end


puts "Seeds created!"
