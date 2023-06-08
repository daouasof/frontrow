require "open-uri"
require "json"
require "rest-client"
require_relative "users"

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
           { name: 'Gojira', url: '1c5efd53-d6b6-4d63-9d22-a15025cf5f07' },
           { name: 'Tool', url: '66fc5bf8-daa4-4241-b378-9bc9077939d2' }]

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


puts "creating users seeds Bowie, Paloma and us!"

default_avatar_url = "https://hips.hearstapps.com/hmg-prod/images/sigourney-weaver-avatar-ii-the-way-of-water-1670323174.jpg?crop=0.500xw:0.949xh;0.299xw,0.0514xh&resize=1200:*"
default_banner_url = "https://townsquare.media/site/62/files/2021/11/attachment-brian-ruiz.jpg?w=980&q=75"
default_password = "123456"
default_city = "Montreal"


USERS.each do |user_hash|
  p user_hash
  new_user = User.new(
    username: user_hash[:username],
    age: user_hash[:age],
    bio: user_hash[:bio],
    email: user_hash[:email]
  )

  avatar = URI.open(user_hash[:avatar_url] || default_avatar_url)
  new_user.avatar.attach(io: avatar, filename: "avatar.png", content_type: "image/png")
  banner = URI.open(user_hash[:banner_url] || default_banner_url)
  new_user.banner.attach(io: banner, filename: "banner.png", content_type: "image/png")

  new_user.city = default_city unless user_hash[:city]
  new_user.password = default_password unless user_hash[:password]
  new_user.save!
end

puts "Done!!!"


puts "creating seed attendace"
Attendance.create!(user: User.first, concert: Concert.first)
puts "done!"

puts "seed writing a review"
bowies_review = Review.new(
  rating: 5,
  content: "What an incredible show! I'm blown away. If you get the chance, this is a MUST SEE",
  attendance: Attendance.first
)
bowies_review.photos.attach(io: URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Muse_in_Sydney.jpg/800px-Muse_in_Sydney.jpg"),
                            filename: "conert_photo_1", content_type: "image/png")
bowies_review.photos.attach(io: URI.open("https://en.parisinfo.com/var/otcp/sites/images/node_43/node_51/node_77884/node_77888/yoyo-palais-de-tokyo-concert-et-lasers-bleus-%7C-630x405-%7C-%C2%A9-cedric-canezza/11967098-1-fre-FR/Yoyo-Palais-de-Tokyo-Concert-et-lasers-bleus-%7C-630x405-%7C-%C2%A9-Cedric-Canezza.jpg"),
                            filename: "conert_photo_2", content_type: "image/png")
bowies_review.photos.attach(io: URI.open("https://turntable.kagiso.io/images/iStock-1181169462.width-800.jpg"),
                            filename: "conert_photo_3", content_type: "image/png")

bowies_review.save!
puts "done!"

puts "seed commenting on review"
Comment.create!(content: "I agree!!!! We are lucky we got to see that!", user: User.last, review: Review.first)
puts "all done!"
