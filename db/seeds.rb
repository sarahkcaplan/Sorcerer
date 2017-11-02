10.times do |t|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", user_type: "teacher").resources_posted.create(title: Faker::Book.title, url: Faker::Internet.url)
end

5.times do |s|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password", user_type: "student")
end
