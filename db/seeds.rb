require_relative 'app_seeds'

puts "Cleaning database..."

puts 'Creating Application Environment'

AppSeeds.generate_environment

puts '#'
puts 'Done!'
