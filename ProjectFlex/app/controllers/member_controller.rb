class MemberController < ApplicationController
    
    before_action CASClient::Frameworks::Rails::Filter
    def memberhome
    end
    
end