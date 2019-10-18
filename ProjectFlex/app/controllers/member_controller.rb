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
        @calendar_options = [
            {
                title: 'event1',
                start: '2019-10-10'
            },
            {
                title: 'event2',
                start: '2019-10-11'
            }
        ]
        # to test the database
        @events = Event.all
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