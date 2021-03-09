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
    'Singapore'
  ]
  CALENDAR_ID = [
    "u4db1ernvfc20f9p5m68kokc8g@group.calendar.google.com",
    "fr6l6iohckfhp97js5ekehttlo@group.calendar.google.com",
    "dvtsegrpcsm0r4db3ss4kiqo1k@group.calendar.google.com",
    "p7pl4q2ng9bgic5q4gr92lc17o@group.calendar.google.com",
    "qgh1la8ebs19v1fncsv6ke8e6k@group.calendar.google.com",
    "3bfdgpjblt4unl78fce9sepnm0@group.calendar.google.com",
    "jlh61kuh97rkt21ev1ue5n7ci4@group.calendar.google.com",
    "vdois991duaef4avt0qe26snc4@group.calendar.google.com",
    "21dm2votkrutvla4g8bnjpqe8k@group.calendar.google.com",
    "5k3o8nr5f5dd6aehuuvb9fb568@group.calendar.google.com",
    "ddle1p936aqvp7gitounfi4218@group.calendar.google.com",
    "qop015ik6h60o46a1c9c4mippc@group.calendar.google.com",
    "qmsg89nd80dald53ri0ch9hmfc@group.calendar.google.com",
    "l3ou6lofvm9j307ptegtnjrr1c@group.calendar.google.com",
    "are13bipqeo2gql64l2n205k8o@group.calendar.google.com",
    "msbtj12ejj6mt8u96og65832es@group.calendar.google.com",
    "ia01n667gsvsi6o999a1rj9424@group.calendar.google.com",
    "pmr4o20177eqvqei6r8nt8idkc@group.calendar.google.com",
    "8ud29h44ki5ngr7btv87ms12a0@group.calendar.google.com",
    "03n4uu3f0gfias1hsajt4nep08@group.calendar.google.com",
    "h9122cllgtcdhvh1u3al7uetsg@group.calendar.google.com"
  ]

  def self.gen_chat_post_comment (category, city, forum, user)
    chatroom = Chatroom.create!(name: "#{ category }/#{ city.name }", forum: forum )

    1.times do
      if category == 'General'
        post = Post.create!(user: user, forum: forum, content: "The idea is to share your thoutghs about the city!", title: "Tell us your experience in #{city.name}!")
      elsif category == 'Work'
        post = Post.create!(user: user, forum: forum, content: "Looking for a job? Need an employee? Found the right place!;)", title: "Opportunities in #{city.name}!")
      else
        post = Post.create!(user: user, forum: forum, content: 'Looking for someone to go on an adventure?? Let the games begin!', title: "Extreme #{city.name}!")
      end

      1.times do
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

  def self.gen_city(cities, city_index, calendar_id)
    return City.create!(name: cities[city_index], calendar_id: calendar_id[city_index])
  end
end