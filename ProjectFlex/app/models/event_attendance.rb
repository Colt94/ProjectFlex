class EventAttendance < ApplicationRecord
    def self.find_registered_events(username, status)
        EventAttendance.where(user_id: username, status: "approved")
    end
    
    def self.get_submitted_members_for_event(event)
        EventAttendance.where(status: "submitted", event_id: event) 
    end
    
<<<<<<< HEAD
    
=======
    def self.find_unapproved_events(username, status)
        EventAttendance.where(user_id: username, status: "unapproved")
    end
>>>>>>> 0d06c1e1db7f9c79bc8629f6d75dadff6a00666e
end
