require "google/apis/calendar_v3"
require "google/api_client/client_secrets.rb"
require 'googleauth'
class EventsController < ApplicationController
  CALENDAR_ID = '36odr6r9h2up0r8163f26d434o@group.calendar.google.com'

  def new
    @event = Event.new
  end

  def create
    client = get_google_calendar_client current_user
    event = Event.create(event_params)
    byebug
    summary = get_event summary
    client.insert_event('36odr6r9h2up0r8163f26d434o@group.calendar.google.com', summary)
    flash[:notice] = 'Task was successfully added.'
    redirect_to events_path
  end

  def get_google_calendar_client current_user
    client = Google::Apis::CalendarV3::CalendarService.new
    return unless (current_user.present? && current_user.access_token.present? && current_user.refresh_token.present?)
    secrets = Google::APIClient::ClientSecrets.new({
      "web" => {
        "access_token" => current_user.access_token,
        "refresh_token" => current_user.refresh_token,
        "client_id" => ENV["GOOGLE_API_KEY"],
        "client_secret" => ENV["GOOGLE_API_SECRET"]
      }
    })
    begin
      client.authorization = secrets.to_authorization
      client.authorization.grant_type = "refresh_token"

      if !current_user.present?
        client.authorization.refresh!
        current_user.update_attributes(
          access_token: client.authorization.access_token,
          refresh_token: client.authorization.refresh_token,
          expires_at: client.authorization.expires_at.to_i
        )
      end
    rescue => e
      flash[:error] = 'Your token has been expired. Please login again with google.'
      redirect_to :back
    end
    
    scope = Google::Apis::CalendarV3::AclRule::Scope.new(type: "user", value: "jordanderen2@gmail.com")
    rule1 = Google::Apis::CalendarV3::AclRule.new(role: "writer", scope: scope)
    rule = GoogleCalendar::Access.allow('36odr6r9h2up0r8163f26d434o@group.calendar.google.com', rule1)
    current_user.google_calendar_access_id = rule.id
    client
  end
private 
  def get_event summary
    event = Google::Apis::CalendarV3::Event.new({
      summary: params["event"]["summary"],
      location: params["event"]["location"],
      description: params["event"]["description"],
      start: {
        date_time: Time.new(params["event"]["start_date(1i)"],params["event"]["start_date(2i)"],params["event"]["start_date(3i)"],params["event"]["start_date(4i)"],params["event"]["start_date(5i)"]).to_datetime.rfc3339,
        time_zone: "Asia/Kolkata"
        # date_time: '2019-09-07T09:00:00-07:00',
        # time_zone: 'Asia/Kolkata',
      },
    end: {
      date_time: Time.new(params["event"]["end_date(1i)"],params["event"]["end_date(2i)"],params["event"]["end_date(3i)"],params["event"]["end_date(4i)"],params["event"]["end_date(5i)"]).to_datetime.rfc3339,
      time_zone: "Asia/Kolkata"
    }, 
    anyoneCanAddSelf: true,
    '36odr6r9h2up0r8163f26d434o@group.calendar.google.com': true,
   
  })

 
end 





def event_params
  params.require(:event).permit(:summary, :location, :description, :user_id, :city_id, :start_date, :end_date)
end

def self.allow
  calendar_api.insert_acl(calendar_id, rule)
end



end 