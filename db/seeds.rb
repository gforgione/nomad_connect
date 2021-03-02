puts "Cleaning database..."
User.destroy_all
City.destroy_all
Location.destroy_all
Forum.destroy_all
Post.destroy_all
Comment.destroy_all
Chatroom.destroy_all
Message.destroy_all

# gianboy = User.create!(first_name: "gian", last_name: "luca", username: "gluca", password: "123456", email: "gluca@aol.com")
# lisbon = City.create!(name: "Lisbon")
# loc = Location.create!(user_id: jerry.id, city_id: lisbon.id)
# lis = Forum.create!(name: "Lis", group: "General", city: lisbon)
# post = Post.create!(user: jerry, forum: lis, content: "Where can i find cool bars in Lisbon?", title: "cool bars in lisbon") 
# comment = Comment.create!(content: "I like the bar near Cascais", user: gianboy, post: post)
# chatroom = Chatroom.create!(name: "lis.gen", forum: lis)
# message = Message.create!(user: gianboy, content: "whats up guys", chatroom: chatroom)

puts 'Creating our beloved Jerry'
jerry = User.create!(first_name: "jerry", last_name: "derry", email: "jderry@aol.com", username: "jderry", password: "123456")

puts 'Creating Application Enviroment'  
10.times do
  print '#########'
  user = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    email: "#{Faker::Name.initials}@gmail.com", 
    password: "123456",
    username: "#{first_name}#{(1..99).to_a.sample}"
    )
  
  city = City.create!(name: Faker::Address.city)

  location = Location.create!(user_id: user.id, city_id: city.id)

  FORUM_CATEGORIES = ["General", "Work" "Adventures"]

  forum = Forum.create!(name: Faker::Book.title, group: FORUM_CATEGORIES.sample, city: city)

  chatroom = Chatroom.create!(name: "#{ city.name FORUM_CATEGORIES.sample }", forum: forum )
  
  10.times do
    post = Post.create!(user: user, forum: forum, content: Faker::Quote.matz, title: Faker::Quote.singular_siegler)

    5.times do
      comment = Comment.create!(content: Faker::Quote.matz, user: user, post: post)
      message = Message.create!(user: user, content: Faker::Quote.matz, chatroom: chatroom)
    end
  end
end
puts '#'
puts 'Done!'


