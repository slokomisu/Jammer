# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Swipe.destroy_all

15.times do
  password = Faker::Internet.password
  User.create(email: Faker::Internet.email, name: Faker::Name.first_name, instrument: Faker::Music.instrument, password: password, password_confirmation: password)
end
