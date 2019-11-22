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
    
    def self.get_submitted_events_for_member(net_id)
        EventAttendance.where(status: "submitted", user_id: net_id) 
    end
    
    def self.get_all_users_registered(event)
        EventAttendance.where(event_id: event)    
    end
    
    def self.get_user_points(events, point_type)
        events.select{ |event| event.point_type == point_type}
    end

    
    def self.get_total(events)
        total = 0
        events.each{ |event|
            total += event.point_value
        }
        return total
    end
    
end
