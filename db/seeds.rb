# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Artwork.destroy_all
User.destroy_all
require "faker"

5.times do
  User.create!(
    first_name: Faker::GreekPhilosophers.name,
    last_name: Faker::GreekPhilosophers.name,
    email: Faker::Internet.email,
    username: Faker::Internet.username(specifier: 5..10),
    # password: Faker::Internet.password(min_length: 8)
  )
end

20.times do
  Artwork.create!(
    name: Faker::GreekPhilosophers.name,
    price: rand(10..40),
    width: rand(50..150),
    height: rand(50..150),
    average_rating: rand(0.0..10.0),
    address: Faker::Address.street_address,
    description: Faker::Quote.matz
  )
end
