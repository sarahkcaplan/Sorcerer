
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Resource.create(:title => 'Bass store', :url => 'http://www.guitarcenter.com/Bass.gc')
Resource.create(:title => 'Brew beer', :url => 'https://www.northernbrewer.com/learn/homebrewing-101/')

10.times do |t|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", user_type: "teacher").resources_posted.create(title: Faker::Book.title, url: Faker::Internet.url)
end

5.times do |s|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", user_type: "student")
end

