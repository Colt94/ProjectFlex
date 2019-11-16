class LoginsController < ApplicationController
    
    def new
        
    end
    def create
        if(request.env['omniauth'] != nil)
            @username = request.env['omniauth.auth'][:info][:email].split("@")[0].strip
        else
            @username = 'coltmo'
        end
        # @username = "kelsey.123"
        @attemptMade = true
        @member = false
        if(User.all.include?(User.get_user(@username)))
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