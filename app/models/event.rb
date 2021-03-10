class Event < ApplicationRecord
  belongs_to :user
  belongs_to :city

  def google_event
    Google::Apis::CalendarV3::Event.new(
      summary: summary,
      location: location,
      description: description,
      start: {
        date_time: start_date.to_datetime.rfc3339,
        time_zone: "Asia/Kolkata"
      },
      end: {
        date_time: end_date.to_datetime.rfc3339,
        time_zone: "Asia/Kolkata"
      }, 
      anyoneCanAddSelf: true
    )
  end 
end
