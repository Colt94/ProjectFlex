class EventAttendance < ApplicationRecord
    def self.find_registered_events(username, status)
        EventAttendance.where(user_id: username, status: "approved")
    end
end
