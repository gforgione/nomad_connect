puts "Cleaning database..."

puts 'Creating Application Enviroment'

users = []
forum_categories = ["General", "Work", "Adventures"]

# Cities with many users
3.times do
  print '##################'
  city = City.create!(name: Faker::Address.city)

  num_of_users = (4..7).to_a.sample

  num_of_users.times do
    name = Faker::Name.first_name
    last_name = Faker::Name.last_name
  
    user = User.create!(
      first_name: name, 
      last_name: last_name, 
      email: "#{name}_#{last_name}@gmail.com", 
      password: "123456",
      username: "#{ name }_#{(1..99).to_a.sample}"
      )

    location = Location.create!(user_id: user.id, city_id: city.id)
    
    2.times do
      forum = Forum.create!(name: Faker::Book.title, group: forum_categories.sample, city: city)

      chatroom = Chatroom.create!(name: "#{ city.name } #{ forum_categories.sample }", forum: forum )
      
      3.times do
        post = Post.create!(user: user, forum: forum, content: Faker::Quote.matz, title: Faker::Quote.singular_siegler)

        3.times do
          comment = Comment.create!(content: Faker::Quote.matz, user: user, post: post)
          message = Message.create!(user: user, content: Faker::Quote.matz, chatroom: chatroom)
        end
      end
    end
  users << user
  end
end

# User with many cities
4.times do
  print '##################'
  name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  user = User.create!(
    first_name: name, 
    last_name: last_name, 
    email: "#{name}_#{last_name}@gmail.com", 
    password: "123456",
    username: "#{ name }_#{(1..99).to_a.sample}"
    )

  num_of_cities = (2..4).to_a.sample
    
  num_of_cities.times do
    city = City.create!(name: Faker::Address.city)

    location = Location.create!(user_id: user.id, city_id: city.id)

    users.each do |user|
      city.user_ids = city.user_ids << user.id
    end

    city.save

    2.times do
      forum = Forum.create!(name: Faker::Book.title, group: forum_categories.sample, city: city)

      chatroom = Chatroom.create!(name: "#{ Faker::Book.title } / #{ city.name }", forum: forum )
      
      4.times do
        post = Post.create!(user: user, forum: forum, content: Faker::Quote.matz, title: Faker::Quote.singular_siegler)

        3.times do
          comment = Comment.create!(content: Faker::Quote.matz, user: user, post: post)
          message = Message.create!(user: user, content: Faker::Quote.matz, chatroom: chatroom)
        end
      end
    end
  end
end

puts '#'
puts 'Done!'
