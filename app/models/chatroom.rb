class Chatroom < ApplicationRecord
  belongs_to :forum
  has_many :messages

  validates :name, presence: true
end
