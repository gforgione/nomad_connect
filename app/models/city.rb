# require 'google_calendar'
# require "google/apis/calendar_v3"
class City < ApplicationRecord
  # after_create :create_calendar
  has_many :forums
  has_many :locations
  has_many :users, through: :locations
  has_one_attached :photo
  validates :name, presence: true, uniqueness: true
  has_many :events

#   def create_calendar 
#     calendar = Google::Apis::CalendarV3::Calendar.new(summary: "NomadConnect-#{name} calendar", time_zone: 'America/Los_Angeles')
#     response = GoogleCalendar.api.insert_calendar(calendar)
#     update(calendar_id: response.id)
#     rule = Google::Apis::CalendarV3::AclRule.new(
#       scope: {
#         type: 'default'
#       },
#       role: 'reader'
#     )
#     GoogleCalendar.api.insert_acl(response.id, rule)
# end

end 
