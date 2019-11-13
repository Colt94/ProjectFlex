class LoginsController < ApplicationController
    
    def new
        
    end
    def create
        @username = request.env['omniauth.auth'][:info][:email].split("@")[0].strip
        # @username = "kelsey.123"
        @attemptMade = true
        @member = false
        if(User.search_netid(@username) > 0)
            session[:cas_user] = @username
            @member = true
            $memberType = User.get_user(@username).permissions
            session[:memType] = $memberType
        end
        redirect_to root_path
    end
    
    def logout
        session.clear
        redirect_to root_path
    end
    
    
    
end