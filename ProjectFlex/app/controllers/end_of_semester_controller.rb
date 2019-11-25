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
        zlCount = 0
        memberCount = 0
        
        @allUsers.each{ |user|
            checkName = "check" + user.id.to_s
            if(params[checkName] == "on")
                perms = User.get_permission(user.id)
                if(perms == "ZL")
                    zlCount = zlCount + 1
                elsif(perms == "Member")
                    memberCount = memberCount + 1
                end
            end
        }
        
        if(zlCount == 5 && memberCount == 15)
            @allUsers.each{ |user| 
                checkName = "check" + user.id.to_s
                if(params[checkName] == "on")
                    User.promote(user.id)
                elsif(user.net_id != session[:cas_user])
                    User.delete_user(user.id)
                end
            }
        
            EventAttendance.wipe()
            Event.wipe()
            redirect_to(manageusers_url)
        else
            redirect_to(changeyear_url)
        end
    end
    
end