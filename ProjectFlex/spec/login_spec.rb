require File.expand_path("../../config/environment", __FILE__)
require_relative '../app/controllers/member_controller'

require 'rails_helper'

describe MemberController do
    describe 'login' do
        context 'When testing the login button' do
            it 'The login button should authenticate and display a welcome message
                with the correct username' do
                visit "/#home"
                click_button('Login')
                expect(page).to have_text("Hello, username! You are authenticated.")
            end
        end
    end
    
    describe 'logout' do
        context 'When testing the logout button' do
            it 'The logout button should clear the session and return the user
                to the homepage' do
                visit "/#home"
                click_button('Login')
                click_button('Logout')
                expect(page).not_to have_text("Hello, username! You are authenticated.")
            end
        end
    end
end