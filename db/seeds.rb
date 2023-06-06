

puts "Cleaning the comments table"
Comment.destroy_all
puts "Cleaning the reviews table"
Review.destroy_all
puts "Cleaning the attendances table"
Attendance.destroy_all
puts "Cleaning the concerts table"
Concert.destroy_all
puts "Cleaning the artist table"
Artist.destroy_all
puts "Cleaning the users table"
User.destroy_all

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
Attendance.create!(user: User.first, concert: Concert.first)
puts "done!"

puts "seed writing a review"
Review.create!(rating: 5, content: "What an incredible show! I'm blown away. If you get the chance, this is a MUST SEE.",
               attendance: Attendance.first)
puts "done!"

puts "seed commenting on review"
Comment.create!(content: "I agree!!!! We are lucky we got to see that!", user: User.last, review: Review.first )
puts "all done!"
