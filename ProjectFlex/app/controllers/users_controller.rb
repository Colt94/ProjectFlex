class UsersController < ApplicationController
    def create
        @member = User.create!(
            name: params[:userName],
            net_id: params[:userNetID],
            permissions: params[:userPermissions])
        redirect_to(manageusers_url)
    end 
    
    def index
    end
    
    def show
        id = params[:id]
        @user = User.get_user( session[:cas_user])
        @member = User.find(id)
        @user_approved_points = []
        
        events_approved = EventAttendance.find_registered_events(@member.net_id, "approved")
        events_approved.each{ |event_approved|
            @user_approved_points.push(Event.find(event_approved.event_id))
        }
        
        @fr_points = @user_approved_points.select{ |event| event.point_type == "FR"}
        @social_points = @user_approved_points.select{ |event| event.point_type == "Social"}
        @service_points = @user_approved_points.select{ |event| event.point_type == "Service"}
        @ld_points = @user_approved_points.select{ |event| event.point_type == "LD"}
        @pr_points = @user_approved_points.select{ |event| event.point_type == "PR"} 
        @total_points = @user_approved_points.length()
        
        @pending_registrations = false
        @submitted_events = []
        unapproved_events = EventAttendance.get_submitted_events_for_member(@member.net_id)
        unapproved_events.each{ |events_registered|
            @submitted_events.push(Event.find(events_registered.event_id))
        }
        
        if !@submitted_events.empty?
            @pending_registrations = true
        end
    end
    
    def update
        @member = User.find(params[:id])
        @member.update_attributes!(
            name: params[:userName],
            permissions: params[:userPermissions],
            # zone: params[:userZone]
            )
        redirect_to user_path(@member)
    end
    
    def destroy
        @member = User.find(params[:id])
        @member.destroy
        redirect_to manageusers_url
    end
    
    def approve_attendance
        event = params[:event]
        net_id = params[:member]
        EventAttendance.where(user_id: net_id, event_id: event).limit(1).update_all(status: "approved")
        member = User.get_user(net_id)
        redirect_to user_path(member)
    end
    helper_method :approve_attendance
end
