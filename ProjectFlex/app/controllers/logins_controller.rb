class LoginsController < ApplicationController
    
    def new
        
    end
    def create
        puts request.env['omniauth.auth'][:info][:email]
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
    
    
    
end