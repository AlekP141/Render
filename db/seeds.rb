# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

Artwork.destroy_all
User.destroy_all

def createArtworks(user)
  10.times do
    Artwork.create(
      name: Faker::GreekPhilosophers.name,
      price: rand(10..40),
      width: rand(50..150),
      height: rand(50..150),
      average_rating: rand(0.0..5.0).round(2),
      address: Faker::Address.street_address,
      description: Faker::Quote.matz,
      user:
    )
  end
end


user1 = User.create(
  first_name: "User",
  last_name: "1",
  email: "dylon@user.com",
  username: "Dylon",
  password: "123456"
)
createArtworks(user1)

user2 = User.create(
  first_name: "User",
  last_name: "2",
  email: "alek@user.com",
  username: "Alek",
  password: "123456"
)
createArtworks(user2)

user3 = User.create(
  first_name: "User",
  last_name: "3",
  email: "lorenzo@user.com",
  username: "Lorenzo",
  password: "123456"
)
createArtworks(user3)
