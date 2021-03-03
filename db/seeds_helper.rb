class SeedsHelper
  CITIES_ARRAY = [
    'Paris',
    'New York', 
    'Rio de Janeiro', 
    'Barcelona',
    'Lisbon',
    'Rome',
    'London',
    'Dubai',
    'Havana', 
    'Madrid',
    'Bruges',
    'Chicago', 
    'Quebec',
    'Toronto',
    'Vienna',
    'Tokyo',
    'Istanbul',
    'Budapest', 
    'Prague', 
    'Amsterdam', 
    'Singapore', 
    'Sydney', 
    'Vancouver', 
    'Venice'
  ]

  def self.gen_chat_post_comment (category, city, forum, user)
    chatroom = Chatroom.create!(name: "#{ category }/#{ city.name }", forum: forum )

    4.times do
      post = Post.create!(user: user, forum: forum, content: Faker::Quote.matz, title: Faker::Quote.singular_siegler)

      4.times do
        comment = Comment.create!(content: Faker::Quote.matz, user: user, post: post)
        message = Message.create!(user: user, content: Faker::Quote.matz, chatroom: chatroom)
      end
    end
  end

  def self.gen_user
    name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    return (
      User.create!(
      first_name: name, 
      last_name: last_name, 
      email: "#{name}_#{last_name}@gmail.com", 
      password: "123456",
      username: "#{ name }_#{(1..99).to_a.sample}"
      )
    )
  end

  def self.gen_city(cities, city_index)
    return City.create!(name: cities[city_index])
  end
end