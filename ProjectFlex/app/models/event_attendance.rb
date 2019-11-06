class EventAttendance < ApplicationRecord
    def self.find_registered_events(username, status)
        EventAttendance.where(user_id: username, status: status)
    end
    
    def self.get_submitted_members_for_event(event)
        EventAttendance.where(status: "submitted", event_id: event) 
    end
    
end
