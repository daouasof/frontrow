require "json"
require "rest-client"

puts "Clearing database..."
Concert.destroy_all
puts "Concerts destroyed"
Artist.destroy_all
puts "Artists destroyed"
User.destroy_all
puts "Users destroyed"
puts "All done!"

# Creating artist Menzingers & concert instances for Menzingers
puts "Creating the artist The Menzingers"
menzingers = Artist.create(name: "The Menzingers")
puts "Creating concerts for #{menzingers.name}"

url = "https://api.setlist.fm/rest/1.0/artist/3071d829-b9ca-4499-b4f5-74d6d8531aed/setlists"
response = RestClient.get(url, { 'Accept': 'application/json', 'x-api-key': ENV['SETLIST_API_KEY'] })
shows = JSON.parse(response)

shows["setlist"].each do |show|
  concert = Concert.new
  concert.city = show["venue"]["city"]["name"]
  concert.venue = show["venue"]["name"]
  concert.date = show["eventDate"]
  concert.artist_id = menzingers.id
  concert.save!
  puts "Created new concert with id #{concert.id} for #{menzingers.name}"
end

# Creating artist The Gaslight Anthem and concerts for them
puts "Creating the artist The Gaslight Anthem"
gaslight = Artist.create(name: "The Gaslight Anthem")
puts "Creating concerts for #{gaslight.name}"

url = "https://api.setlist.fm/rest/1.0/artist/f208f09e-b5b3-4b06-87cd-f7230fae17e3/setlists"
response = RestClient.get(url, { 'Accept': 'application/json', 'x-api-key': ENV['SETLIST_API_KEY'] })
shows = JSON.parse(response)

shows["setlist"].each do |show|
  concert = Concert.new
  concert.city = show["venue"]["city"]["name"]
  concert.venue = show["venue"]["name"]
  concert.date = show["eventDate"]
  concert.artist_id = gaslight.id
  concert.save!
  puts "Created new concert with id #{concert.id} for #{gaslight.name}"
end

# Creating artist Muse and concerts for them
puts "Creating the artist Muse"
muse = Artist.create(name: "Muse")
puts "Creating concerts for #{muse.name}"

url = "https://api.setlist.fm/rest/1.0/artist/9c9f1380-2516-4fc9-a3e6-f9f61941d090/setlists"
response = RestClient.get(url, { 'Accept': 'application/json', 'x-api-key': ENV['SETLIST_API_KEY'] })
shows = JSON.parse(response)

shows["setlist"].each do |show|
  concert = Concert.new
  concert.city = show["venue"]["city"]["name"]
  concert.venue = show["venue"]["name"]
  concert.date = show["eventDate"]
  concert.artist_id = muse.id
  concert.save!
  puts "Created new concert with id #{concert.id} for #{muse.name}"
end

# Creating artist Burna Boy and concerts for them
puts "Creating the artist Burna Boy"
burnaboy = Artist.create(name: "Burna Boy")
puts "Creating concerts for #{burnaboy.name}"

url = "https://api.setlist.fm/rest/1.0/artist/78a19169-ac75-4868-b504-7e2e073118e0/setlists"
response = RestClient.get(url, { 'Accept': 'application/json', 'x-api-key': ENV['SETLIST_API_KEY'] })
shows = JSON.parse(response)

shows["setlist"].each do |show|
  concert = Concert.new
  concert.city = show["venue"]["city"]["name"]
  concert.venue = show["venue"]["name"]
  concert.date = show["eventDate"]
  concert.artist_id = burnaboy.id
  concert.save!
  puts "Created new concert with id #{concert.id} for #{burnaboy.name}"
end

# Creating artist Polo & Pan and concerts for them
puts "Creating the artist Polo & Pan"
polo_and_pan = Artist.create(name: "Polo & Pan")
puts "Creating concerts for #{polo_and_pan.name}"

url = "https://api.setlist.fm/rest/1.0/artist/1d9ec7ea-0fa4-41d9-917b-723c735ebbfe/setlists"
response = RestClient.get(url, { 'Accept': 'application/json', 'x-api-key': ENV['SETLIST_API_KEY'] })
shows = JSON.parse(response)

shows["setlist"].each do |show|
  concert = Concert.new
  concert.city = show["venue"]["city"]["name"]
  concert.venue = show["venue"]["name"]
  concert.date = show["eventDate"]
  concert.artist_id = polo_and_pan.id
  concert.save!
  puts "Created new concert with id #{concert.id} for #{polo_and_pan.name}"
end

# Creating artist Gojira and concerts for them
puts "Creating the artist Gojira"
gojira = Artist.create(name: "Gojira")
puts "Creating concerts for #{gojira.name}"

url = "https://api.setlist.fm/rest/1.0/artist/1c5efd53-d6b6-4d63-9d22-a15025cf5f07/setlists"
response = RestClient.get(url, { 'Accept': 'application/json', 'x-api-key': ENV['SETLIST_API_KEY'] })
shows = JSON.parse(response)

shows["setlist"].each do |show|
  concert = Concert.new
  concert.city = show["venue"]["city"]["name"]
  concert.venue = show["venue"]["name"]
  concert.date = show["eventDate"]
  concert.artist_id = gojira.id
  concert.save!
  puts "Created new concert with id #{concert.id} for #{gojira.name}"
end

puts "creating user seed Bowie"
User.create!(username: "Bowie", age: 23, city: "Montreal", bio: "Hello there! I am Bowie, a super cool dude from Montreal", email: "bowie@bowie.com", password: "123456")
puts "done!"
