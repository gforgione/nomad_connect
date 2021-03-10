require_relative 'seeds_helper'

class AppSeeds

  @@users = []
  @@forum_categories = ["General", "Work", "Adventures"]
  @@cities = SeedsHelper::CITIES_ARRAY
  @@calendar_ids = SeedsHelper::CALENDAR_ID
  @@photo_keys = SeedsHelper::PHOTO_KEYS
  @@city_index = 0

  def self.generate_environment
    gen_jerry
    gen_model_1
    gen_model_2
  end

  private

  def self.gen_jerry
    user = SeedsHelper.jerry_user

    6.times do
      city = SeedsHelper.gen_city(@@cities, @@city_index, @@calendar_ids)
      @@city_index += 1
  
      location = Location.create!(user_id: user.id, city_id: city.id)
  
      @@users.each { |user| city.user_ids = city.user_ids << user.id }
      city.save

      @@forum_categories.each do |category|
        forum = Forum.create!(name: "#{category} - #{ city.name }", group: category, city: city)
        SeedsHelper.gen_chat_post_comment(category, city, forum, user)
      end
    end
  end

  def self.gen_model_1
    # Cities with many users
    3.times do
      print '##################'
      city = SeedsHelper.gen_city(@@cities, @@city_index, @@calendar_ids)
      @@city_index += 1
    
      num_of_users = (4..7).to_a.sample

      num_of_users.times do
        user = SeedsHelper.gen_user
    
        location = Location.create!(user_id: user.id, city_id: city.id)
        
        @@forum_categories.each do |category|
          forum = Forum.new(name: "#{category} - #{ city.name }", group: category, city: city)
          SeedsHelper.gen_chat_post_comment(category, city, forum, user) if forum.save
        end
      @@users << user
      end
    end
  end

  def self.gen_model_2
    # Users with many cities
    4.times do
      print '##################'
      user = SeedsHelper.gen_user

      3.times do
        city = SeedsHelper.gen_city(@@cities, @@city_index, @@calendar_ids)
        @@city_index += 1
    
        location = Location.create!(user_id: user.id, city_id: city.id)
    
        @@users.each { |user| city.user_ids = city.user_ids << user.id }
        city.save

        @@forum_categories.each do |category|
          forum = Forum.create!(name: "#{category} - #{ city.name }", group: category, city: city)
          SeedsHelper.gen_chat_post_comment(category, city, forum, user)
        end
      end
    end
  end
end