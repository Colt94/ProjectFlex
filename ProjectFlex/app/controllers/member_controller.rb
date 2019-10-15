class MemberController < ApplicationController
    
    #before_action CASClient::Frameworks::Rails::Filter
    
    def home
        #@username = session[:cas_user]
        @username = "brett.martin"
        render :template => 'static/home'
    end
    
    def approvepoints
        # to test the database
        @pending_approval = EventAttendance.where(status: "unapproved")
    end
    
    def calendar
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