Given("the user is logged in") do
    #@username = "TestUser"
    visit "/#home"
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        'provider' => 'google_oauth2',
        'info' => {
            'email' => 'coltmo@tamu.edu'
        }
    })
     
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    click_link('Login with your tamu Google account')
end

When("the user goes to the calendar page") do
    
    within('#sidebar') do
        click_link('Calendar')
    end
end

Then("the user should see a calendar with events displayed") do
    page.should have_content('Calendar')
end

Given("the user has permissions") do
    visit "/#home"
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        'provider' => 'google_oauth2',
        'info' => {
            'email' => 'coltmo@tamu.edu'
        }
    })
     
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    click_link('Login with your tamu Google account')
end
When("the user goes to event page") do
    visit"/calendar"
end
Then("they should see a add event button") do
    page.should have_button("New Event")
end