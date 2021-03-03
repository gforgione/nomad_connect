class Forum < ApplicationRecord
  belongs_to :city
  has_many :posts
  has_one :chatroom

  validates :name, presence: true, uniqueness: true
  validates :group, presence: true
end
