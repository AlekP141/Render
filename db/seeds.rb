# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

puts "Cleaning database ..."
Booking.destroy_all
Artwork.destroy_all
User.destroy_all

def createArtworks(user)
  image_urls = [
    "https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1064&q=80",
    "https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1045&q=80",
    "https://images.unsplash.com/photo-1599894019794-50339c9ad89c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1035&q=80",
    "https://images.unsplash.com/photo-1579783901586-d88db74b4fe4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y2xhc3NpYyUyMGFydHxlbnwwfHwwfHx8Mg%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1578301978162-7aae4d755744?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=977&q=80",
    "https://images.unsplash.com/photo-1579783928621-7a13d66a62d1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y2xhc3NpYyUyMGFydHxlbnwwfHwwfHx8Mg%3D%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1576773689115-5cd2b0223523?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNsYXNzaWMlMjBhcnR8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1577720643272-265f09367456?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1578925773717-a41e4a7fa4b0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=680&q=80",
    "https://images.unsplash.com/photo-1598565061944-fdd9f2775f98?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
    "https://images.unsplash.com/photo-1549289524-06cf8837ace5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGNsYXNzaWMlMjBhcnR8ZW58MHx8MHx8fDI%3D&auto=format&fit=crop&w=900&q=60",
    "https://images.unsplash.com/photo-1578926314433-e2789279f4aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1010&q=80",
    "https://images.unsplash.com/photo-1578321271369-d008a1ee4fd2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1031&q=80",
    "https://images.unsplash.com/photo-1578301977947-cb446e84e8cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1023&q=80"
  ]

  address = [
    "138 Kingsland Rd London E2 8DY",
    "10 Downing Street Westminster London SW1A 2AA",
    "221B Baker Street Marylebone London NW1 6XE",
    "160 Great Portland Street Fitzrovia London W1W 5QA",
    "1 Abbey Road St John's Wood London NW8 9AY",
    "32 London Bridge Street Southwark London SE1 9SG",
    "221 Strand Covent Garden London WC2R 1AP",
    "123 Oxford Street Soho London W1D 2HU",
    "28 Portobello Road Notting Hill London W11 3DG",
    "66 The Cut Waterloo London SE1 8LZ",
    "1 St Martin's Le Grand City of London London EC1A 4NP",
    "30 Leicester Square West End London WC2H 7LA",
    "160 Oxford Street Westminster London W1D 1NN",
    "45 St. James's Place St. James's London SW1A 1NH",
    "9 Savile Row Mayfair London W1S 3PF",
    "20 Fenchurch Street City of London London EC3M 3BY",
    "10 Hanover Square Mayfair London W1S 1JH",
    "1 Canada Square Canary Wharf London E14 5AB",
    "40 Liverpool Street City of London London EC2M 7QN",
    "77 Baker Street Marylebone London W1U 6RF",
    "18 Victoria Embankment Westminster London EC4Y 0DH"
  ]

  10.times do
    artwork = Artwork.new(
      name: Faker::GreekPhilosophers.name,
      price: rand(10..40),
      width: rand(50..150),
      height: rand(50..150),
      average_rating: rand(0.0..5.0).round(2),
      address: address.sample,
      description: Faker::Quote.matz,
      user: user
    )
    file = URI.open(image_urls.sample)
    artwork.photo.attach(io: file, filename: "#{artwork.name}.png", content_type: "image/png")
    artwork.save
    puts "Artwork #{artwork.id} saved"
  end
end

user1 = User.create(
  first_name: "User",
  last_name: "1",
  email: "dylon@user.com",
  username: "Dylon",
  password: "123456"
)
puts "User #{user1.id} created"
createArtworks(user1)

user2 = User.create(
  first_name: "User",
  last_name: "2",
  email: "alek@user.com",
  username: "Alek",
  password: "123456"
)
puts "User #{user2.id} created"
createArtworks(user2)

user3 = User.create(
  first_name: "User",
  last_name: "3",
  email: "lorenzo@user.com",
  username: "Lorenzo",
  password: "123456"
)
puts "User #{user3.id} created"
createArtworks(user3)
