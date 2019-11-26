class MemberController < ApplicationController
    
    
    def home
    end
    
    def approvepoints
        netid = session[:cas_user]
        @user = User.get_user(netid)
        if @user == nil || @user.permissions != "Exec" && @user.permissions != "ZL"
            redirect_to root_path
        end
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
        if @user == nil
            redirect_to root_path
        end
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
    
    def endofsemester
    end
    
    def forms
    end
    
    def manageusers
        netid = session[:cas_user]
        @user = User.get_user(netid)
        if @user == nil || @user.permissions != "Exec" && @user.permissions != "ZL"
            redirect_to root_path
        end
        @allUsers = User.get_all_users()
        @allPoints = {}
        metPoints = {}
        @status = {}
        
        @allUsers.each do |this_user|
            if this_user.permissions == "Member"
                user_points = []
                
                events_attended = EventAttendance.find_registered_events(this_user.net_id, "approved")
                events_attended.each{ |event_attended|
                    user_points.push(Event.find(event_attended.event_id))
                }
                fr_points = EventAttendance.get_user_points(user_points, "FR")
                social_points = EventAttendance.get_user_points(user_points, "Social")
                service_points = EventAttendance.get_user_points(user_points, "Service")
                ld_points = EventAttendance.get_user_points(user_points, "LD")
                pr_points = EventAttendance.get_user_points(user_points, "PR")
                
                #Check points requirements
                fr_total = EventAttendance.get_total(fr_points)
                social_total = EventAttendance.get_total(social_points)
                service_total = EventAttendance.get_total(service_points)
                ld_total = EventAttendance.get_total(ld_points)
                pr_total = EventAttendance.get_total(pr_points) 
                user_total = fr_total + social_total + service_total + ld_total + pr_total
                
                @allPoints[this_user.name] = user_total
                metPoints[this_user.name] = User.points_met?(fr_total, social_total, service_total, ld_total, pr_total) && user_total >= 15
            else
                @allPoints[this_user.name] = "N/A"
            end
            #if @allPoints[this_user.name].to_i < 19
                #@status[this_user.name] = "Points NOT met"
            if this_user.permissions == "Member"
                if metPoints[this_user.name]
                    @status[this_user.name] = "Points Met"
                else
                    @status[this_user.name] = "Points NOT Met"
                end
            else
                @status[this_user.name] = "N/A"
            end
        end
        
        @all_permissions = User.get_all_permissions
    end
    
    def marketplace
    end
    
    def mypoints
        netid = session[:cas_user]
        @user = User.get_user(netid)
        if @user == nil || @user.permissions != "Member"
            redirect_to root_path
        end
        user_points = []
        
        events_attended = EventAttendance.find_registered_events(netid, "approved")
        events_attended.each{ |event_attended|
            user_points.push(Event.find(event_attended.event_id))
        }
        @fr_points = EventAttendance.get_user_points(user_points, "FR")
        @social_points = EventAttendance.get_user_points(user_points, "Social")
        @service_points = EventAttendance.get_user_points(user_points, "Service")
        @ld_points = EventAttendance.get_user_points(user_points, "LD")
        @pr_points = EventAttendance.get_user_points(user_points, "PR")
        
        #Check points requirements
        @fr_total = EventAttendance.get_total(@fr_points)
        @social_total = EventAttendance.get_total(@social_points)
        @service_total = EventAttendance.get_total(@service_points)
        @ld_total = EventAttendance.get_total(@ld_points)
        @pr_total = EventAttendance.get_total(@pr_points) 
        @user_total = @fr_total + @social_total + @service_total + @ld_total + @pr_total
        
        @made_points = User.points_met?(@fr_total, @social_total, @service_total, @ld_total, @pr_total) && @user_total >= 15
    end
    
    def myregistrations
        netid = session[:cas_user]
        @user = User.get_user(netid)
        if @user == nil || @user.permissions != "Member"
            redirect_to root_path
        end
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