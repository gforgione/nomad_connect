class City < ApplicationRecord
  has_many :forums

  validates :name, presence: true, uniqueness: true
end
