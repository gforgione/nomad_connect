require "google/apis/calendar_v3"
require "google/api_client/client_secrets.rb"
require 'googleauth'
require 'google_calendar'
class EventsController < ApplicationController
  def index 
    @city = City.find(params[:city_id])
  end 

  def new
    @event = Event.new
    @city = City.find(params[:city_id])
  end
  
  def create
    @city = City.find(params[:city_id])
    @event = Event.new(event_params)
    @event.user = current_user
    @event.city = @city
    if @event.save
      GoogleCalendar.api.insert_event(@city.calendar_id, @event.google_event)
      flash[:notice] = 'Task was successfully added.'
      redirect_to city_events_path
    else 
      render :new 
    end 
  end 

  private 

  def event_params
    params.require(:event).permit(:summary, :location, :description, :start_date, :end_date)
  end
end 