class Event < ApplicationRecord
    
    def self.get_event(e_id) 
        Event.find_by(id: e_id)
    end
    
    def self.get_max_signups(e_id)
        event = Event.find_by(id: e_id)
        return event.max_signups
    end
    
    def self.get_current_signups(e_id)
        event = Event.find_by(id: e_id)
        return event.current_signups
    end
    
    def self.full(e_id)
        event = Event.find_by(id: e_id)
        if((event.max_signups != 0) && (event.current_signups >= event.max_signups))
            return true
        else
            return false
        end
    end
    
    def self.add_registration(e_id)
        event = Event.find_by(id: e_id)
        event.increment!(:current_signups)
    end
    
    def self.remove_registration(e_id)
        event = Event.find_by(id: e_id)
        event.decrement!(:current_signups)
    end
end
