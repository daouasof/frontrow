# puts "creatting attendances for Bruce Springsteen"
# bruce_concert = Concert.find_by(artist: "Bruce Springsteen", venue: "Bell Center")

# puts "creating seed cat attendance"
# cat = User.find_by(username: "Cat")
# Attendance.create!(user: cat, concert: bruce_concert)
# puts "done!"

# 15.times do
#   user = User.where.not(username: "Cat").sample
#   puts "creating seed #{user.username} attendance"
#   Attendance.create!(user: user, concert: bruce_concert)
#   puts "done!"
# end
