class EventAttendance < ApplicationRecord
    def self.destroy_single_attendance(username, event)
        EventAttendance.where(user_id: username, event_id: event).destroy_all   
    end
    
    def self.find_registered_events(username, status)
        EventAttendance.where(user_id: username, status: status)
    end
    
    def self.get_submitted_members_for_event(event)
        EventAttendance.where(status: "submitted", event_id: event) 
    end
    
    def self.find_unapproved_events(username, status)
        EventAttendance.where(user_id: username, status: "unapproved")
    end
end
