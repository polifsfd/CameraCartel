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
User.destroy_all

puts "Creating seeds"

user = User.create!(email: "user@gmail.com", password: "123456", first_name: "John", last_name: "Doe")
user1 = User.create!(email: "user1@gmail.com", password: "123456", first_name: "Jane", last_name: "White")
user2 = User.create!(email: "user2@gmail.com", password: "123456", first_name: "Jack", last_name: "Black")
user3 = User.create!(email: "user3@gmail.com", password: "123456", first_name: "Jill", last_name: "Green")

camera1 = {name: "Nikon fm2n", details: "A great film camera from the 80s - Equiped with a 50mm 1.8 lens", category: "Film", price: 20.00, year: 1987, model: "fm2n", picture_url: "https://upload.wikimedia.org/wikipedia/commons/0/00/Nikon_FM2_et_Nikkor_50mm_f1.8.jpg"  , user: user}
camera2 = {name: "Canon AE", details: "A great film camera from the 90s - Equiped with a 50mm 1.8 lens", category: "Film", price: 20.00, year: 1982, model: "AE", picture_url: "https://upload.wikimedia.org/wikipedia/commons/8/85/Canon_AE1_BL.jpg", user: user1}
camera3 = {name: "Minolta SR", details: "A great film camera from the 80s - Equiped with a 50mm 1.8 lens", category: "Film", price: 20.00, year: 1985, model: "SRT 101", picture_url: "https://upload.wikimedia.org/wikipedia/commons/8/85/Canon_AE1_BL.jpg", user: user2}
camera4 = {name: "Nikon D80", details: "A great digital camera from early 2000s - Equiped with a 18-55mm 13.5 lens", category: "DSLR", price: 20.00, year: 2007, model: "D80", picture_url: "https://upload.wikimedia.org/wikipedia/commons/c/ca/Nikon_D80DSLR.jpg", user: user}



[camera1, camera2, camera3, camera4].each do |attributes|
  camera = Camera.create!(attributes)
  puts "Created #{camera.name}"
end


puts "Seeds created!"
