class LoginsController < ApplicationController
    
    def new
        
    end
    def create
        @username = request.env['omniauth.auth'][:info][:email].split("@")[0].strip
        @attemptMade = true
        @member = false
        if(User.search_netid(@username) > 0)
            session[:cas_user] = @username
            @member = true
            $memberType = User.get_user(@username).permissions
            session[:memType] = $memberType
        end
        render :template => 'static/home'
    end
    
    def logout
        session.clear
        render :template => 'static/home'
    end
    
    
    
end