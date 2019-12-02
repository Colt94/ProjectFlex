require File.expand_path("../../../config/environment", __FILE__)
require_relative '../../app/models/user.rb'

require 'rails_helper'

describe User, type: :model  do
    describe "Getting user by ID" do
        it "returns a user with the ID" do
            expect((User.get_user("joseph20santana")).name).to eq("Joseph")
        end
    end
    
    describe "Getting users with same netID" do
        it "returns number of users with netID" do
            expect((User.search_netid("joseph20santana"))).to eq(1)
        end
    end
    
    describe "Getting all users in table" do
        it "returns an array of users" do
            expect((User.get_all_users).size).not_to eq(0)
        end
    end
    
    describe "Getting all members in table" do
        it "returns an array of member" do
            expect((User.get_all_members).size).not_to eq(0)
        end
    end
    
    describe "Getting all available permissions" do
        it "returns an array of permissions" do
            expect((User.get_all_permissions).size).to eq(3)
        end
    end
    
    describe "Checking if user met points requirements" do
        it "returns true" do
            expect((User.points_met?(2,3,3,1,3))).to eq(true)
        end
    end
    
    describe "Getting user permissions by ID" do
        it "returns permissions of user with ID" do
            expect((User.get_permission(15))).to eq("Exec")
        end
    end
    
    describe "Deleting user by ID" do
        it "returns deleted user" do
            expect((User.delete_user(15)).name).to eq("Joseph")
        end
    end
    
    describe "Deleting user by ID" do
        it "returns deleted user" do
            expect((User.delete_user(15)).name).to eq("Joseph")
        end
    end
    
    describe "Clear users table" do
        it "returns one user" do
            expect(User.wipe).not_to be_nil
        end
    end
    
    describe "Promotes user given ID" do
        it "returns true" do
            expect((User.promote(9))).to eq(true)
        end
    end
end