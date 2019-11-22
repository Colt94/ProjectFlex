class EndOfSemesterController < ApplicationController
    
    def clearpoints
    end
    
    def clearpointsconfirmed
        EventAttendance.wipe()
        Event.wipe()
        redirect_to(calendar_url)
    end

    def changeyear
        @allUsers = User.get_all_users()
    end
    
    def beginNewYear
        @allUsers = User.get_all_users()
        
        @allUsers.each{ |user| 
            checkName = "check" + user.id.to_s
            if(params[checkName] == "on")
                User.promote(user.id)
            elsif(user.net_id != session[:cas_user])
                User.delete_user(user.id)
            end
        }
        
        redirect_to(manageusers_url)
    end
    
end