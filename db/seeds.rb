


jerry = User.new(first_name: "jerry", last_name: "derry", email: "jderry@aol.com", username: "jderry", password: "123456")
jerry.save!
gianboy = User.new(first_name: "gian", last_name: "luca", username: "gluca", password: "123456", email: "gluca@aol.com")
gianboy.save!
lisbon = City.new(name: "Lisbon")
lisbon.save!
loc = Location.new(user_id: jerry.id, city_id: lisbon.id)
loc.save!
lis = Forum.new(name: "Lis", group: "General", city: lisbon)
lis.save!
post = Post.new(user: jerry, forum: lis, content: "Where can i find cool bars in Lisbon?", title: "cool bars in lisbon") 
post.save!
comment = Comment.new(content: "I like the bar near Cascais", user: gianboy, post: post)
comment.save!
chatroom = Chatroom.new(name: "lis.gen", forum: lis)
chatroom.save!
message = Message.new(user: gianboy, content: "whats up guys", chatroom: chatroom)
message.save!

