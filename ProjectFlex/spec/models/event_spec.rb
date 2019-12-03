require File.expand_path("../../../config/environment", __FILE__)
require_relative '../../app/models/event.rb'

require 'rails_helper'

describe Event, type: :model  do
    describe "Getting event by ID" do
        it "returns an event with the ID" do
            expect((Event.get_event(1)).name).to eq("Chick-fil-A Profit Share")
        end
    end
    
   describe "Getting max signups for an event with ID" do
        it "returns max number of signups" do
            expect((Event.get_max_signups(1))).not_to eq(0)
        end
    end
    
    describe "Getting current signups for an event with ID" do
        it "returns number of current signups" do
            expect((Event.get_current_signups(1))).not_to eq(0)
        end
    end
    
    describe "Checking if event is full" do
        it "returns false" do
            expect((Event.full(1))).not_to eq(true)
        end
    end
    
    describe "Adding a signup to an event" do
        it "returns 4, seed is at 3 signups, 3+1=4" do
            expect((Event.add_registration(1).current_signups)).to eq(4)
        end
    end
    
    describe "Removing a signup to an event" do
        it "returns 2, seed is at 3 signups, 3-1=2" do
            expect((Event.remove_registration(1).current_signups)).to eq(2)
        end
    end
    
    describe "Clear events table" do
        it "returns one event" do
            expect(Event.wipe).not_to be_nil
        end
    end
end
    