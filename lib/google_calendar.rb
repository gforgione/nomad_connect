module GoogleCalendar
  module_function
  def api
    @calendar_api ||= build_and_authorize_api_client
  end
  def build_and_authorize_api_client
    client  = Google::Apis::CalendarV3::CalendarService.new
    client.authorization = auth
    client
  end
  def auth
    # Default service app authentication, using environment variables
    Google::Auth.get_application_default(scopes)
  end
  def scopes
    # Scopes for access calendars and their events
    [
      "https://www.googleapis.com/auth/calendar",
      "https://www.googleapis.com/auth/calendar.events"
    ]
  end
end