require "json"
require "rest-client"

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
puts "Cleaning the users table."
User.destroy_all

bands = [{ name: 'The Menzingers', url: '3071d829-b9ca-4499-b4f5-74d6d8531aed' },
           { name: 'The Gaslight Anthem', url: 'f208f09e-b5b3-4b06-87cd-f7230fae17e3' },
           { name: 'Muse', url: '9c9f1380-2516-4fc9-a3e6-f9f61941d090' },
           { name: 'Burna Boy', url: '78a19169-ac75-4868-b504-7e2e073118e0' },
           { name: 'Polo & Pan', url: '1d9ec7ea-0fa4-41d9-917b-723c735ebbfe' },
           { name: 'Louise Attaque', url: '04d25080-32e2-49a2-b638-c9ca4f3e12bd' },
           { name: 'Gojira', url: '1c5efd53-d6b6-4d63-9d22-a15025cf5f07' }]

bands.each do |band|
  sleep(3)
  puts "Creating the artist #{band[:name]}"
  artist = Artist.create(name: "#{band[:name]}")
  puts "Creating concerts for #{band[:name]}"

  url = "https://api.setlist.fm/rest/1.0/artist/#{band[:url]}/setlists"

  response = RestClient.get(url, { 'Accept': 'application/json', 'x-api-key': ENV['SETLIST_API_KEY'] })
  shows = JSON.parse(response)

    shows["setlist"].each do |show|
      concert = Concert.new
      concert.city = show["venue"]["city"]["name"]
      concert.venue = show["venue"]["name"]
      concert.date = show["eventDate"]
      concert.artist_id = artist.id
      concert.save!
      puts "Created new concert with id #{concert.id} for #{band[:name]}"
    end
end

puts "creating user seeds Bowie and Paloma"
User.create!(username: "Bowie", age: 23, city: "Montreal", bio: "Hello there! I am Bowie, a super cool dude from Montreal.",
             email: "bowie@bowie.com", password: "123456")

User.create!(username: "Paloma", age: 24, city: "Montreal", bio: "Hi everyone! Paloma here, happy to go to shows anytime
             I can.", email: "paloma@paloma.com", password: "123456")
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
