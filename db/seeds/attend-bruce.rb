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

puts "creating seed Jean-Claude attendance"
jean-Claude = User.find_by(username: "Jean-Claude")
Attendance.create!(user: jean-Claude, concert: bruce_concert)
puts "done!"

puts "creating seed Clarence attendance"
clarence = User.find_by(username: "Clarence")
Attendance.create!(user: clarence, concert: bruce_concert)
puts "done!"

puts "creating seed Flo attendance"
flo = User.find_by(username: "Flo")
Attendance.create!(user: flo, concert: bruce_concert)
puts "done!"
