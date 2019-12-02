require File.expand_path("../../../config/environment", __FILE__)
require_relative '../../app/models/event_attendance.rb'

require 'rails_helper'

describe Event, type: :model  do
    describe "Removing user from attendance" do
        it "returns removed user" do
            expect((EventAttendance.destroy_single_attendance("maggie.123", 1))).not_to be_nil
        end
    end
    
    describe "Finding events a user is registered to" do
        it "returns an array of events" do
            expect((EventAttendance.find_registered_events("maggie.123", "submitted"))).not_to be_nil
        end
    end
    
    describe "Finding users who have registered for an event" do
        it "returns an array of users" do
            expect((EventAttendance.get_submitted_members_for_event(1))).not_to be_nil
        end
    end
    
    describe "Finding users who have registered for an event" do
        it "returns an array of users" do
            expect((EventAttendance.get_submitted_members_for_event(1))).not_to be_nil
        end
    end
    
    describe "Finding events a user is registered for" do
        it "returns an array of events" do
            expect((EventAttendance.get_submitted_events_for_member("maggie.123"))).not_to be_nil
        end
    end
    
    describe "Finding all users who have registered for something" do
        it "returns an array of users" do
            expect((EventAttendance.get_all_users_registered(1))).not_to be_nil
        end
    end
end