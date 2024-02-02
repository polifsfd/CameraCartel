# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "Clean database"
Camera.destroy_all
User.destroy_all

puts "Creating seeds"

user = User.create!(email: "user@gmail.com", password: "123456", first_name: "John", last_name: "Doe")
user1 = User.create!(email: "user1@gmail.com", password: "123456", first_name: "Jane", last_name: "White")
user2 = User.create!(email: "user2@gmail.com", password: "123456", first_name: "Jack", last_name: "Black")
user3 = User.create!(email: "user3@gmail.com", password: "123456", first_name: "Jill", last_name: "Green")

camera1 = {name: "Nikon", details: "A great film camera from the 80s - Mounted with a 50mm 1.8 lens", category: "Film", price: 20.00, year: 1987, model: "fm2n", picture_url: "https://upload.wikimedia.org/wikipedia/commons/0/00/Nikon_FM2_et_Nikkor_50mm_f1.8.jpg"  , user: user}
camera2 = {name: "Canon", details: "A great film camera from the 90s - Mounted with a 50mm 1.8 lens", category: "Film", price: 20.00, year: 1982, model: "AE", picture_url: "https://upload.wikimedia.org/wikipedia/commons/8/85/Canon_AE1_BL.jpg", user: user1}
camera3 = {name: "Minolta", details: "A great film camera from the 80s - Mounted with a 50mm 1.8 lens", category: "Film", price: 20.00, year: 1985, model: "SRT 101", picture_url: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Minolta_srt_101_IMGP3035_wp.jpg", user: user2}
camera4 = {name: "Nikon", details: "A great digital camera from early 2000s - Mounted with a 18-55mm 13.5 lens", category: "DSLR", price: 20.00, year: 2007, model: "D80", picture_url: "https://upload.wikimedia.org/wikipedia/commons/c/ca/Nikon_D80DSLR.jpg", user: user3}

camera5 = {name: "Polaroid", details: "Instant film camera", category: "Instant", price: 15.00, year: 1990, model: "636", picture_url: "https://upload.wikimedia.org/wikipedia/commons/7/7b/Polaroid_636_Close_Up_instant_camera.jpg"  , user: user}
camera6 = {name: "Fuji Instax", details: "A great instant camera with a retro look", category: "Instant", price: 20.00, year: 2023, model: "mini Evo", picture_url: "https://static.fnac-static.com/multimedia/Images/FR/MDM/95/37/12/17971093/3756-1/tsp20240201174900/Appareil-photo-instantane-Fujifilm-Instax-Mini-Evo-Noir.jpg", user: user1}
camera7 = {name: "Fuji", details: "Premium compact camera with a retro look and renders great shots - 23mm 1.8 lens", category: "Compact", price: 45.00, year: 2020, model: "X100V", picture_url: "https://www.camara.net/images/com_hikashop/upload/FUJI_X100V_noir.jpg", user: user2}
camera8 = {name: "Ricoh", details: "Premium compact camera with a zoom and vibration control - 28mm 2.8 lens", category: "Compact", price: 20.00, year: 2021, model: "GR3", picture_url: "https://www.camara.net/images/com_hikashop/upload/Ricoh-gr3_.jpg", user: user3}

camera9 = {name: "Sony", details: "Best bridge camera on the market, tropicalized, with a x25 zoom and great video recording capacity - 24-600mm lens", category: "Bridge", price: 30.00, year: 2023, model: "RX10 Mk4", picture_url: "https://cdn.lesnumeriques.com/produits/16/41081/sony-rx10-iv_783699e547c6e312.jpg", user: user}
camera10 = {name: "Panasonic", details: "Bridge camera, fast and efficient with a x24 zoom - 25-600mm 2.8 lens", category: "Bridge", price: 20.00, year: 2019, model: "FZ300", picture_url: "https://cdn.lesnumeriques.com/produits/60/27469/panasonic-lumix-fz300_c8dbce61f45950d4.jpg", user: user1}
camera11 = {name: "Sony", details: "The best mirrorless camera, full-frame with a 33MP resolution and 4k video recording capacity - 24-36mm 2.8 lens", category: "Mirrorless", price: 45.00, year: 2023, model: "A7 IV", picture_url: "https://cdn.mos.cms.futurecdn.net/99Y5TFcsFbKuRP7jyS9SiS-970-80.jpg.webp", user: user2}
camera12 = {name: "Canon", details: "The best compact mirrorless camera with a 32MP resolution and 4k video recording capacity - 18-55mm 2.4 lens", category: "Mirrorless", price: 20.00, year: 2022, model: "EOS R7", picture_url: "https://cdn.mos.cms.futurecdn.net/4yqrdYLnAqmMmrjJRZGCzG-970-80.jpg.webp", user: user3}

[camera1, camera2, camera3, camera4, camera5, camera6,camera7, camera8, camera9, camera10, camera11, camera12].each do |attributes|
  file = URI.open(attributes[:picture_url])
  camera = Camera.new(attributes)
  camera.picture.attach(io: file, filename: "#{attributes[:name]}.png", content_type: "image/png")
  camera.save
  puts "Created #{camera.name}"
end


puts "Seeds created!"


#article = Article.new(title: "NES", body: "A great console")
#article.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
#article.save
