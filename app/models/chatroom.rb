class Chatroom < ApplicationRecord
  belongs_to :forum
  has_many :messages
end
