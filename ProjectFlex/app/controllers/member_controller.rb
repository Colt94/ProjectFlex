class MemberController < ApplicationController
    
    #before_action CASClient::Frameworks::Rails::Filter
    
    def home
        #@username = session[:cas_user]
        @username = "brett.martin"
        render :template => 'static/home'
    end
    
    def approvepoints
    end
    
    def calendar
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