# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }]
#   Character.create(name: "Luke", movie: movies.first)
puts "Clearing database..."
Concert.destroy_all
puts "Concerts destroyed"
Artist.destroy_all
puts "Artists destroyed"
User.destroy_all
puts "Users destroyed"
puts "All done!"

require "json"
require "rest-client"

menzingers = "3071d829-b9ca-4499-b4f5-74d6d8531aed"
artist = Artist.create(name: "The Menzingers")
puts "Creating concerts for #{artist.name}"

url = "https://api.setlist.fm/rest/1.0/artist/#{menzingers}/setlists"
response = RestClient.get(url, { 'Accept': 'application/json', 'x-api-key': ENV['SETLIST_API_KEY'] })

shows = JSON.parse(response)
# pp shows
# pp shows.keys
shows["setlist"].each do |show|
  concert = Concert.new
  concert.city = show["venue"]["city"]
  concert.venue = show["venue"]["name"]
  concert.date = show["eventDate"]
  # concert.artist_id = Artist.first
  concert.save!
  puts "Created new concert with id #{concert.id}"
end


puts "creating user seed Bowie"

User.create!(username: "Bowie", age: 23, city: "Montreal", bio: "Hello there! I am Bowie, a super cool dude from Montreal", email: "bowie@bowie.com", password: "123456")
puts "done!"


puts "creating artist seed Led Zeppelin "
Artist.create!(name: "Led Zeppelin")
puts "done!"

puts "creating a concert seed Olympic Stadium - Led Zeppelin"
Concert.create!(city: "Montreal", venue: "Olympic Stadium", date: DateTime.new(2001, 2, 3, 4, 5, 6), average_rating: "4.5", artist: Artist.first)
puts "done!"
