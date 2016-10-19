# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first



10.times do
  email = Faker::Internet.email
  password = '123456'
  password_confirmation = '123456'
  
  User.create!(email: email, password: password, password_confirmation: password_confirmation)
end


User.all.each do |user|
  4.times do
    event_name = Faker::Name.name
    event_date = Faker::Date.forward(150)
    event_rsvp_date = Faker::Date.forward(150)
    event_type = 'wedding'
    path = Faker::Number.number(4) + Faker::Name.first_name
    
    user.events.create!(event_name: event_name,
                        event_date: event_date,
                        event_rsvp_date: event_rsvp_date,
                        event_type: event_type,
                        path: path)
  end
end

Event.all.each do |event|
  10.times do
    @party = event.parties.create!
    3.times do
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = Faker::Internet.email
      phone = Faker::Number.number(9)
      
      @party.guests.create!(first_name: first_name,
                          last_name: last_name,
                          email: email,
                          phone: phone)
    end
  end
endUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')