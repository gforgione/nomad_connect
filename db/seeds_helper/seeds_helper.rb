class SeedsHelper
  # User section
  def self.gen_user
    name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    
    return (
      User.create!(
      first_name: name, 
      last_name: last_name,
      bio: Faker::Quote.jack_handey,
      email: "#{name}_#{last_name}@gmail.com", 
      password: "123456",
      username: "#{name}_#{(1..99).to_a.sample}"
      )
    )
  end

  def self.jerry_user
    return (
      User.create!(
        first_name: "Jerry", 
        last_name: "Derry",
        bio: Faker::Quote.jack_handey,
        email: "jderry@aol.com", 
        username: "jerry_the_legend", 
        password: "123456")
    )
  end

  # City section
  def self.gen_city_environment (category, city, user)
    forum = Forum.create!(name: "#{category[:name]} - #{ city.name }", group: category[:name], city: city)
    chatroom = Chatroom.create!(name: "#{category[:name]}/#{city.name}", forum: forum )
    post = Post.create!(user: user, forum: forum, content: category[:post], title: "#{category[:title]} #{city.name}!")
    Comment.create!(content: category[:comment], user: user, post: post)
    Message.create!(user: user, content: category[:message], chatroom: chatroom)
  end

  def self.gen_city(cities, city_index, calendar_id, photo_keys)
    return (
      City.create!(
        name: cities[city_index],
        calendar_id: calendar_id[city_index],
        photo_key: photo_keys[city_index]
      ))
  end
end
