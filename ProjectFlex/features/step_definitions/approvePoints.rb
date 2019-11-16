Event.create(:name => "Winter Formal", :date => "2019-10-02T20:00:00", :point_value => 1, :point_type => "Social" )
EventAttendance.create(:user_id => "maggie.123", :event_id => 2, :status => "submitted")
User.create(:name => "Grant", :permissions => "exec", :net_id => "grant.123")


Given("that user is logged in with permissions") do
    visit "/#home"
    
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        'provider' => 'google_oauth2',
        'info' => {
            'emai' => 'coltmo@tamu.edu'
        }
    })
     
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    
    click_link("Login with your tamu Google account")
end

When("they go to approve points page") do
    within('#sidebar') do
        click_link('Approve Points')
    end
end

Then("they should see the contents of event list table") do
    page.has_table?("events")
end

Given("the user has permissions and is on aprrove points page") do
    visit "/#home"
    
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        'provider' => 'google_oauth2',
        'info' => {
            'emai' => 'coltmo@tamu.edu'
        }
    })
     
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    
    click_link("Login with your tamu Google account")
    within('#sidebar') do
        click_link('Approve Points')
    end
end

When("they click on a specfic event") do
    #Event.create(:name => "Winter Formal", :date => "2019-10-02T20:00:00", :point_value => 1, :point_type => "Social" )
    #EventAttendance.create(:user_id => "maggie.123", :event_id => 2, :status => "submitted")
    click_link("Winter Formal")
end

Then("the page should display users who need approval for that event") do
    page.has_table?("event_attendances")
end



