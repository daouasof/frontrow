# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }]
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning the users table"
User.destroy_all
puts "Cleaning the artist table"
Artist.destroy_all
puts "Cleaning the concerts table"
Concert.destroy_all

puts "creating user seeds Bowie and Paloma"
User.create!(username: "Bowie", age: 23, city: "Montreal", bio: "Hello there! I am Bowie, a super cool dude from Montreal.",
             email: "bowie@bowie.com", password: "123456")

User.create!(username: "Paloma", age: 24, city: "Montreal", bio: "Hi everyone! Paloma here, happy to go to shows anytime
             I can.", email: "paloma@paloma.com", password: "123456")
puts "done!"

puts "creating artist seed Led Zeppelin "
Artist.create!(name: "Led Zeppelin")
puts "done!"

puts "creating a concert seed Olympic Stadium - Led Zeppelin"
Concert.create!(city: "Montreal", venue: "Olympic Stadium", date: DateTime.new(2001, 2, 3, 4, 5, 6), average_rating: "4.5",
                artist: Artist.first)
puts "done!"

puts "creating seed attendace"
Attendance.create!(user_id: User.first, concert_id: Concert.first)
puts "done!"

puts "seed writing a review"
Review.create!(rating: 5, content: "What an incredible show! I blown away. If you get the chance, this is a MUST SEE.",
               attendance_id: Attendance.first)
puts "done!"

puts "seed commenting on review"
Comment.create!(content: "I agree!!!! We are lucky we got to see that!", user_id: User.last, review_id: Review.first )
