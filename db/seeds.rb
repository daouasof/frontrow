# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create([username: "Bowie", age: 23, city: "Montreal", bio: "Hello there! I am Bowie, a super cool dude from Montreal", email: "bowie@bowie.com", password: "12345"])
