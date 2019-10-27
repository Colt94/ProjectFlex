class EventsController < ApplicationController
    def event
    end
    
    def create
        event = Event.create(
            name: params[:eventName],
            date: params[:eventDate],
            point_value: params[:pointValue],
            point_type: params[:pointType])
        redirect_to(calendar_url)
    end
    
    def index
    end
    
    def show
        id = params[:id]
        @event = Event.find(id)
    end
    
end