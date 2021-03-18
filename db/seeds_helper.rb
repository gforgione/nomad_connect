class SeedsHelper

  def self.gen_chat_post_comment (category, city, forum, user)
    chatroom = Chatroom.create!(name: "#{ category }/#{ city.name }", forum: forum )

    if category == 'General'
      post = Post.create!(user: user, forum: forum, content: "The idea is to share your thoutghs about the city!", title: "Tell us your experience in #{city.name}!")
    elsif category == 'Work'
      post = Post.create!(user: user, forum: forum, content: "Looking for a job? Need an employee? Found the right place!;)", title: "Opportunities in #{city.name}!")
    else
      post = Post.create!(user: user, forum: forum, content: 'Looking for someone to go on an adventure?? Let the games begin!', title: "Extreme #{city.name}!")
    end

    if category == 'General'
      comment = Comment.create!(content: 'Amazing, the locals are great!', user: user, post: post)
      comment = Comment.create!(content: "Best food I've ever had!", user: user, post: post)
      message = Message.create!(user: user, content: 'Hellooooo!', chatroom: chatroom)
    elsif category == 'Work'
      comment = Comment.create!(content: "I'm looking for a job! Experienced Rails Developer!", user: user, post: post)
      comment = Comment.create!(content: "I also need a Designer, for my next app!", user: user, post: post)
      message = Message.create!(user: user, content: 'Good evening, everyone!', chatroom: chatroom)
    else
      comment = Comment.create!(content: 'Who wants to go on a skydiving adventure?', user: user, post: post)
      comment = Comment.create!(content: "I'm looking for an adrenaline junkie! Let's let's go bungee jumping!!!!", user: user, post: post)
      message = Message.create!(user: user, content: "Hi, everyone!", chatroom: chatroom)
    end
  end

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

  def self.gen_city(cities, city_index, calendar_id, photo_keys)
    return (
      City.create!(
        name: cities[city_index],
        calendar_id: calendar_id[city_index],
        photo_key: photo_keys[city_index]
      ))
  end
end



