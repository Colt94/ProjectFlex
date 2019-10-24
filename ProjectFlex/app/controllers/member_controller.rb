class MemberController < ApplicationController
    
    #before_action CASClient::Frameworks::Rails::Filter
    
    def login
        #@username = session[:cas_user]
        @username = "username"
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
        
        @calendar_options = []
        @events.each do |event|
            @calendar_options.push({ 
                title: event.name, 
                start: event.date, 
                color: color_hash[event.point_type],
            })
        end
        
    end
    
    def newEvent
        event = Event.create(
            name: params[:eventName],
            date: params[:eventDate],
            point_value: params[:pointValue],
            point_type: params[:pointType])
        redirect_to(calendar_url)
    end
    
    def forms
    end
    
    def marketplace
    end
    
    def mypoints
    end
    
    def myregistrations
    end
    
end