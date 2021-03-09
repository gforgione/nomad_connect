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
    'Venice',
    'Porto',
    'Beijing',
    'Bergen',
    'Copenhagen'
  ]

  PHOTO_KEYS = [
    "0qtt3be7cbzw2j7rxd9fkdos8e02",
    "e145i1awz4vu5uqxpm0rxgm7yq24",
    "j4abx9e6eomjrm4k09wa57k738ya",
    "t04v1knysrlwd7q6dur3ekobu41n",
    "loox1jgok6sku3u8l843f9hjwi4h",
    "4r5697joyh5g2541ayb4txzmffz8",
    "e2hgbwqyp95jelimrw1h9x6p4vv9",
    "r12q9h7e3q4kl4i41f6i13nsfs9t",
    "rsx2st5xag5tlp9ahtwnguvst1y0",
    "2402he9xj33te4c9ik9d5udipj68",
    "nuxivd15ziw6vqbz8oqy8aqyu1si",
    "gdijkjqarj4thcivb27umcjs8a3r",
    "38upinfefxfbiyd2p5bgn85poi9n",
    "gq379fpxyfl2bhyrrnkkdyfcgg5i",
    "5mtqx4an2yd3xhwoeihcefiq8eq3",
    "wqffhzzqgg5fttk7g269mbba02y9",
    "5chxqt18l1jh03fbgcd0icpbfflu",
    "wajncsd5kvkl0d9n8tjvjbt0ciyo",
    "9hqrv8j8iwr58zr0vhgstlfhzgie"
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

  def self.gen_city(cities, city_index)
    return City.create!(name: cities[city_index])
  end
end