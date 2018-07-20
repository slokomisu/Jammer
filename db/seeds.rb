# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Swipe.destroy_all

me = User.create(email: 'test@email.com', name: 'John', instrument: Faker::Music.instrument,
                 password: 'password', password_confirmation: 'password')
me.clip.attach(io: File.open('app/assets/audios/bensound-happyrock.mp3'), filename: 'bensound-happyrock.mp3')

20.times do
  pw = Faker::Internet.password
  user = User.create(email: Faker::Internet.email, name: Faker::Name.first_name, instrument: Faker::Music.instrument, password: pw, password_confirmation: pw)
  user.clip.attach(io: File.open('app/assets/audios/bensound-happyrock.mp3'), filename: 'bensound-happyrock.mp3')
end



Swipe.create(swipee_id: me.id, user_id: rand(2..20), liked: true)
Swipe.create(swipee_id: me.id, user_id: rand(2..20), liked: true)
Swipe.create(swipee_id: me.id, user_id: rand(2..20), liked: true)
Swipe.create(swipee_id: me.id, user_id: rand(2..20), liked: true)
Swipe.create(swipee_id: me.id, user_id: rand(2..20), liked: true)
Swipe.create(swipee_id: me.id, user_id: rand(2..20), liked: true)


