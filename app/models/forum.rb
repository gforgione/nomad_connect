class Forum < ApplicationRecord
  belongs_to :city
  has_many :posts
  has_one :chatroom
end
