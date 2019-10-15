class MemberController < ApplicationController
    
    #before_action CASClient::Frameworks::Rails::Filter
    
    def home
        #@username = session[:cas_user]
        @username = "brett.martin"
        session[:cas_user] = @username
        render :template => 'static/home'
    end
    
    def approvepoints
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