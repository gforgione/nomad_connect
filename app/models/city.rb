class City < ApplicationRecord
  has_many :forums
  has_many :locations
  has_many :users, through: :locations
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  has_many :events
end
