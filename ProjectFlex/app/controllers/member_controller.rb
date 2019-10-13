class MemberController < ApplicationController
    
    before_action CASClient::Frameworks::Rails::Filter
    
    def memberhome
        @username = session[:cas_user]
    end
    
end