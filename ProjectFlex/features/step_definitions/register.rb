Event.create(:name => "Test Event", :date => "2019-10-02T20:00:00", :point_value => 1, :point_type => "Social" )
User.create(:name => "coltonMem", :permissions => "Member", :net_id => "coltmoMem", :user_zone => "PR")
Given("the user has logged in") do
    visit "/#home"
    
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        provider: 'google_oauth2',
        info: {
            email: 'coltmoMem@tamu.edu'
        }
    })
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    
    click_link("Login with your TAMU Google account")
end
When ("the user goes to his registration page") do
    #print page.html
    within('#smallScreen') do
        click_link('My Registration')
    end
end
Then ("the user should see all events that the user registered for") do
    
    page.should have_content("My Registrations") 
    page.should have_content("FR:")
    page.should have_content("Social:")
    page.should have_content("Service:")
    page.should have_content("LD:")
    page.should have_content("PR:")
end

Given("the user is logged in and on the calendar page") do
    visit "/#home"
    
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        provider: 'google_oauth2',
        info: {
            email: 'coltmoMem@tamu.edu'
        }
    })
     
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    
    click_link("Login with your TAMU Google account")
    within("#smallScreen") do
        click_link("Calendar")
    end
end

When("the user clicks a specific event") do
    visit 'events/2'
    #print page.html
    
end

Then("the user should see a register button") do
    #print page.html
    #page.should have_button("Register")
    User.where(name: "coltonMem").delete_all
    Event.where(name: "Test Event").delete_all
end