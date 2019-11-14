class MemberController < ApplicationController
    
    
    def home
    end
    
    def approvepoints
        @events = Event.all
        @approvepoints_events = []
        @events.each do |event|
            @approvepoints_events.push({
                id: event.id,
                title: event.name,
            })
        end
    end
    
    def calendar
        # to test the database
        netid = session[:cas_user]
        @user = User.get_user(netid)
        @events = Event.all
        
        # color hash
        color_hash = {
            "FR" => "rgb(29, 191, 99)",
            "Social" => "rgb(255, 97, 113)",
            "Service" => "rgb(86, 147, 245)",
            "LD" => "rgb(255, 249, 89)",
            "PR" => "rgb(208, 89, 255)"
        }
        
        @calendar_events = []
        @events.each do |event|
            @calendar_events.push({ 
                id: event.id,
                title: event.name, 
                start: event.date, 
                color: color_hash[event.point_type],
            })
        end
        
    end
    
    def forms
    end
    
    def manageusers
        netid = session[:cas_user]
        @user = User.get_user(netid)
        @allUsers = User.get_all_users()
        @allPoints = {}
        @allUsers.each do |this_user|
            if this_user.permissions == "Member"
                points = EventAttendance.find_registered_events(this_user.net_id, "approved").count
                @allPoints[this_user.name] = points
            else
                @allPoints[this_user.name] = "N/A"
            end
        end
        
        @all_permissions = User.get_all_permissions
    end
    
    def marketplace
    end
    
    def mypoints
        netid = session[:cas_user]
        @user = User.get_user(netid)
        @user_points = []
        
        events_attended = EventAttendance.find_registered_events(netid, "approved")
        events_attended.each{ |event_attended|
            @user_points.push(Event.find(event_attended.event_id))
        }
        @fr_points = @user_points.select{ |event| event.point_type == "FR"}
        @social_points = @user_points.select{ |event| event.point_type == "Social"}
        @service_points = @user_points.select{ |event| event.point_type == "Service"}
        @ld_points = @user_points.select{ |event| event.point_type == "LD"}
        @pr_points = @user_points.select{ |event| event.point_type == "PR"} 
    end
    
    def myregistrations
        netid = session[:cas_user]
        @user = User.get_user(netid)
        @user_events = []
        
        events_registered = EventAttendance.find_registered_events(netid, "submitted")
        events_registered.each{ |event_registered|
            @user_events.push(Event.find(event_registered.event_id))
        }
        @fr_events = @user_events.select{ |event| event.point_type == "FR"}
        @social_events = @user_events.select{ |event| event.point_type == "Social"}
        @service_events = @user_events.select{ |event| event.point_type == "Service"}
        @ld_events = @user_events.select{ |event| event.point_type == "LD"}
        @pr_events = @user_events.select{ |event| event.point_type == "PR"} 
    end
    
end