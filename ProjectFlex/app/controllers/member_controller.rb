class MemberController < ApplicationController
    
    #before_action CASClient::Frameworks::Rails::Filter
    
    def login
        #@username = session[:cas_user]
        @username = "evan.123"
        session[:cas_user] = @username
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
    end
    
    def calendar
        # to test the database
        @events = Event.all
        
        # color hash
        color_hash = {
            "fr" => "rgb(29, 191, 99)",
            "social" => "rgb(255, 97, 113)",
            "service" => "rgb(86, 147, 245)",
            "ld" => "rgb(255, 249, 89)",
            "pr" => "rgb(208, 89, 255)"
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
        username = session[:cas_user]
        @user = User.find_by(net_id: username)
        @user_points = [];
        
        events_attended = EventAttendance.where(user_id: username, status: "approved")
        events_attended.each{ |event_attended|
            @user_points.push(Event.find(event_attended.event_id))
        }
        @fr_points = @user_points.select{ |event| event.point_type == "fr"}; 
        @social_points = @user_points.select{ |event| event.point_type == "social"}; 
        @service_points = @user_points.select{ |event| event.point_type == "service"}; 
        @ld_points = @user_points.select{ |event| event.point_type == "ld"}; 
        @pr_points = @user_points.select{ |event| event.point_type == "pr"}; 
        
        
        
    end
    
    def myregistrations
    end
    
end