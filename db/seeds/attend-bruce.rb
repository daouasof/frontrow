puts "creatting attendances for Bruce Springsteen"
bruce_concert = Concert.find_by(artist: "Bruce Springsteen", venue: "Bell Center")

puts "creating seed cat attendance"
cat = User.find_by(username: "Cat")
Attendance.create!(user: cat, concert: bruce_concert)
puts "done!"

puts "creating seed Benoit attendance"
benoit = User.find_by(username: "Benoit")
Attendance.create!(user: benoit, concert: bruce_concert)
puts "done!"

puts "creating seed Sebastien attendance"
sebastien = User.find_by(username: "Sebastien")
Attendance.create!(user: sebastien, concert: bruce_concert)
puts "done!"

puts "creating seed Fred attendance"
fred = User.find_by(username: "Fred")
Attendance.create!(user: fred, concert: bruce_concert)
puts "done!"

puts "creating seed Stephane attendance"
stephane = User.find_by(username: "Stephane")
Attendance.create!(user: stephane, concert: bruce_concert)
puts "done!"

puts "creating seed Ines attendance"
ines = User.find_by(username: "Ines")
Attendance.create!(user: ines, concert: bruce_concert)
puts "done!"
