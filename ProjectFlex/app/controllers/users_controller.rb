class UsersController < ApplicationController
    def create
        @member = User.create!(
            name: params[:userName],
            net_id: params[:userNetID],
            permissions: params[:userPermissions],
            user_zone: params[:userZone])
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
        
        @fr_points = EventAttendance.get_user_points(@user_approved_points, "FR")
        @social_points = EventAttendance.get_user_points(@user_approved_points, "Social")
        @service_points = EventAttendance.get_user_points(@user_approved_points, "Service")
        @ld_points = EventAttendance.get_user_points(@user_approved_points, "LD")
        @pr_points = EventAttendance.get_user_points(@user_approved_points, "PR")
        
        @fr_total = EventAttendance.get_total(@fr_points)
        @social_total = EventAttendance.get_total(@social_points)
        @service_total = EventAttendance.get_total(@service_points)
        @ld_total = EventAttendance.get_total(@ld_points)
        @pr_total = EventAttendance.get_total(@pr_points) 
        @user_total = @fr_total + @social_total + @service_total + @ld_total + @pr_total
        
        @made_points = User.points_met?(@fr_total, @social_total, @service_total, @ld_total, @pr_total) && @user_total >= 15
        
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
            net_id: params[:net_id],
            permissions: params[:userPermissions],
            user_zone: params[:userZone])
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
    
    def reject_attendance
       EventAttendance.destroy_single_attendance(params[:member], params[:event])
       Event.remove_registration(params[:event])
       member = User.get_user(params[:member])
       redirect_to user_path(member)
    end
    helper_method :reject_attendance
    
end
