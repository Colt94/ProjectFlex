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
    
    describe "GET approvepoints" do
        it "returns a 200 OK status" do
            get(:approvepoints, params: nil, session: {'cas_user' => "joseph20santana"})
            expect(response).to have_http_status(200)
        end
    end
    
    describe "GET calendar" do
        it "returns a 200 OK status" do
            get(:calendar, params: nil, session: {'cas_user' => "joseph20santana"})
            expect(response).to have_http_status(200)
        end
    end
    
    
    describe "GET member#manageusers" do
        it "returns a 302 redirect status" do
            get(:manageusers, params: nil, session: {'cas_user' => "joseph20santana"})
            expect(response).to have_http_status(302)
        end
    end
    
    describe "GET member#mypoints" do
        it "returns a 302 redirect status" do
            get "mypoints"
            expect(response).to have_http_status(302)
        end
    end
    
    describe "GET member#myregistrations" do
        it "returns a 302 redirect status" do
            get "myregistrations"
            expect(response).to have_http_status(302)
        end
    end
    
    describe "GET member#endofsemester" do
        it "returns a 200 OK status" do
            get "endofsemester"
            expect(response).to have_http_status(200)
        end
    end
    
end
