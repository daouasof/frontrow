# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }]
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning the users table"
User.destroy_all
puts "Cleaning the concerts table"
Concert.destroy_all
puts "Cleaning the attendances table"
Attendance.destroy_all


puts "creating user seed Bowie"
User.create!(username: "Bowie", age: 23, city: "Montreal", bio: "Hello there! I am Bowie, a super cool dude from Montreal",
             email: "bowie@bowie.com", password: "123456")
puts "done!"
