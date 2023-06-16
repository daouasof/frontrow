puts "creatting attendances for Gojira"
gojira = Artist.find_by(name: "Gojira")
gojira_concert = Concert.find_by(artist_id: gojira.id, venue: "Place Bell")

puts "creating seed Cat attendance"
cat = User.find_by(username: "Cat")
Attendance.create!(user: cat, concert: gojira_concert)
puts "done!"

puts "creating seed Stephane attendance"
stephane = User.find_by(username: "Stephane")
Attendance.create!(user: stephane, concert: gojira_concert)
puts "done!"

puts "creating seed Ines attendance"
ines = User.find_by(username: "Ines")
Attendance.create!(user: ines, concert: gojira_concert)
puts "done!"



# 15.times do
#   user = User.where.not(username: "Cat").sample
#   puts "creating seed #{user.username} attendance"
#   Attendance.create!(user: user, concert: gojira_concert)
#   puts "done!"
# end
