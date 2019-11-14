class EventsController < ApplicationController
    def event
    end
    
    def create
        
        @event = Event.create!(
            name: params[:eventName],
            date: params[:eventDate],
            point_value: params[:pointValue],
            point_type: params[:pointType],
            max_signups: params[:maxSignups],
            mandatory: params[:mandatory])
            
        if params[:mandatory]
            attendance_list = []
            allUsers = User.get_all_members()
            allUsers.each do |user|
                attendance = { :user_id => user.net_id, 
                               :user_name => user.name, 
                               :user_zone => user.user_zone, 
                               :event_id => @event.id, 
                               :status => "submitted" }
                attendance_list.push(attendance)
            end
            
            attendance_list.each do |attendance|
                EventAttendance.create!(attendance)
            end
        end
            
        redirect_to(calendar_url)
    end
    
    def destroy
        Event.get_event(params[:id]).destroy
        redirect_to("/calendar")
    end
    
    def index
    end
    
    def update
        
        event = Event.get_event(params[:id])
        event.name = params[:eventName]
        event.date = params[:eventDate]
        event.point_value = params[:pointValue]
        event.point_type = params[:pointType]
        event.max_signups = params[:maxSignups]
        
        event.save
        redirect_to("/events/" + params[:id])
        
    end
    
    def show
        id = params[:id]
        @user = User.get_user(session[:cas_user])
        @event = Event.find(id)
        @attendances = []
        EventAttendance.where(event_id: id, user_id: session[:cas_user]).find_each do |attendance|
            @attendances.push(attendance)
        end
        
        @maxSignups = Event.get_max_signups(id)
        @currSignups = Event.get_current_signups(id)
        @spotsOpen = true
        if @currSignups == @maxSignups
            @spotsOpen = false
        end
        
        @registered = false
        @approved = false
        if @attendances != []
            if @attendances[0].status == "approved"
                @approved = true
            else
                @registered = true
            end
        end
        
        @unapproved_users = EventAttendance.get_submitted_members_for_event(id)
        @all_users_registered = EventAttendance.get_all_users_registered(id)
    end
    
    def approve_attendance
        event = params[:event]
        user = params[:user]
        EventAttendance.where(user_id: user, event_id: event).limit(1).update_all(status: "approved")
        redirect_to event_path(event)
    end
    helper_method :approve_attendance
    
    
end