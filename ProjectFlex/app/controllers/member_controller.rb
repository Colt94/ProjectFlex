class MemberController < ApplicationController
    
    #before_action CASClient::Frameworks::Rails::Filter
    def login
        #@username = session[:cas_user]
        @attemptMade = true
        @member = false
        @username = "evan.123"
        if(User.search_netid(@username) > 0)
            session[:cas_user] = @username
            @member = true
            $memberType = User.get_user(@username).permissions
            session[:memType] = $memberType
        end
        render :template => 'static/home'
    end
    
    def logout
        #CASClient::Frameworks::Rails::Filter.logout(self)
        session.clear
        render :template => 'static/home'
    end
    
    def approvepoints
        # to test the database
        @pending_approval = EventAttendance.where(status: "unapproved")
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
        @fr_points = @user_points.select{ |event| event.point_type == "fr"}
        @social_points = @user_points.select{ |event| event.point_type == "social"}
        @service_points = @user_points.select{ |event| event.point_type == "service"}
        @ld_points = @user_points.select{ |event| event.point_type == "ld"}
        @pr_points = @user_points.select{ |event| event.point_type == "pr"} 
    end
    
    def myregistrations
        netid = session[:cas_user]
        @user = User.get_user(netid)
        @user_events = []
        
        events_registered = EventAttendance.find_unapproved_events(netid, "unapproved")
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