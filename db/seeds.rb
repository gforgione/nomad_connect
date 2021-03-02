puts "Cleaning database..."
User.destroy_all
City.destroy_all
Location.destroy_all
Forum.destroy_all
Post.destroy_all
Comment.destroy_all
Chatroom.destroy_all
Message.destroy_all

puts 'Creating our beloved Jerry'

puts 'Creating Application Enviroment'  
9.times do
  print '###########'
  user = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: "#{Faker::Name.initials}@gmail.com", 
    password: "123456",
    username: "#{ Faker::Name.first_name }_#{(1..99).to_a.sample}"
    )
  5.times do
    city = City.create!(name: Faker::Address.city)

    location = Location.create!(user_id: user.id, city_id: city.id)

    forum_categories = ["General", "Work", "Adventures"]

    2.times do
      forum = Forum.create!(name: Faker::Book.title, group: forum_categories.sample, city: city)

      chatroom = Chatroom.create!(name: "#{ city.name } #{ forum_categories.sample }", forum: forum )
      
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

jerry = User.create!(first_name: "jerry", last_name: "derry", email: "jderry@aol.com", username: "jderry", password: "123456")

puts '#'
puts 'Done!'
