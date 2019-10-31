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
        @attendances = []
        EventAttendance.where(event_id: id, user_id: session[:cas_user]).find_each do |attendance|
            @attendances.push(attendance)
        end
        
        @registered = false
        if @attendances != []
            @registered = true
        end
        
        @users = User.where(permissions: "member")
    end
    
end