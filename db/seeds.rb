# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning DB.."
Fan.destroy_all

puts "inserting fans"

12.times do
  new_user = User.create!(email: Faker::Internet.email, password: "password")
  new_fan = Fan.create!(name: Faker::Marketing.buzzwords, nationality: Faker::Nation.nationality, description: Faker::ChuckNorris.fact, category: Faker::Fantasy::Tolkien.poem, price:  rand(10..100), user: new_user )

  #user.photo.attached?
  puts "#{new_fan.name} was sucessfully created!"
end

puts "done."
