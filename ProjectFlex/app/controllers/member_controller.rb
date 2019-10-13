class MemberController < ApplicationController
    
    before_action CASClient::Frameworks::Rails::Filter
    
    def home
        @username = session[:cas_user]
        session[:cas_user] = @username
        #@username = "Coltmo"
        render :template => 'static/home'
    end
    
end