class EndOfSemesterController < ApplicationController
    
    def clearpoints
    end
    
    def clearpointsconfirmed
        EventAttendance.wipe()
        Event.wipe()
        redirect_to(calendar_url)
    end

    def changeyear
    end
        
end