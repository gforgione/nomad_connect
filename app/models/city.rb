class City < ApplicationRecord
  has_many :forums
  has_many :users, through: :locations

  validates :name, presence: true, uniqueness: true
end
