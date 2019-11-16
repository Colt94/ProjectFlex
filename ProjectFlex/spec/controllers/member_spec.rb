require File.expand_path("../../../config/environment", __FILE__)
require_relative '../../app/controllers/member_controller'

require 'rails_helper'

describe MemberController, type: :controller  do
    
    describe '#login' do
        context 'When testing the login button' do
            it 'The login button should autheticate and display a welcome message
            with the correct username' do
                visit "/#home"
                expect(page).to have_content("Welcome to the homepage")
            end
        end
    end
    
    describe '#logout' do
      context 'When testng the logout button' do
            it 'The logout button should clear the session and return the user
            to the homepage' do
                visit "/#home"
                expect(page).not_to have_content("You are authenticated.")
            end
        end
    end
    
    describe '#approvepoints' do
        it 'approves event registration and grants points' do
            subject.approvepoints
            expect(subject.instance_variable_get(:@events)).not_to eql(nil)
        end
    end
    
    describe '#mypoints' do
        it 'displays all approved events' do
            subject.mypoints
            expect(subject.instance_variable_get(:@user)).to eql(nil)
        end
    end
    
    describe '#myregistrations' do
        it 'displays all registered but unapproved events' do
            subject.myregistrations
            expect(subject.instance_variable_get(:@user)).to eql(nil)
        end
    end
    
    describe "GET member#manageusers" do
        it "returns a 200 OK status" do
            get "manageusers"
            expect(response).to have_http_status(:ok)
        end
    end
    
    describe "GET member#mypoints" do
        it "returns a 200 OK status" do
            get "mypoints"
            expect(response).to have_http_status(:ok)
        end
    end
    
    describe "GET member#myregistrations" do
        it "returns a 200 OK status" do
            get "myregistrations"
            expect(response).to have_http_status(:ok)
        end
    end
    
    describe "GET member#calendar" do
        it "returns a 200 OK status" do
            get "calendar"
            expect(response).to have_http_status(:ok)
        end
    end
    
end
