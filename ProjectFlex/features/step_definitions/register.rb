Given("the user has logged in") do
    visit "/#home"
    
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        'provider' => 'google_oauth2',
        'info' => {
            'email' => 'coltmo@tamu.edu'
        }
    })
     
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    
    click_link("Login with your tamu Google account")
end
When ("the user goes to his registration page") do
    within('#sidebar') do
        #click_link('My Registration')
    end
end
Then ("the user should see all events that the user registered for") do
    
    #page.should have_content("My Registration") 
    #page.should have_content("Fundraising:")
    #page.should have_content("Social:")
    #page.should have_content("Service:")
    #page.should have_content("Leadership Dev:")
    #page.should have_content("PR:")
end

Given("the user is logged in and on the calendar page") do
    visit "/#home"
    
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        'provider' => 'google_oauth2',
        'info' => {
            'email' => 'coltmo@tamu.edu'
        }
    })
     
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    
    click_link("Login with your tamu Google account")
    within("#sidebar") do
        click_link("Calendar")
    end
end

When("the user clicks a specific event") do
    within('#sidebar') do
        click_link("Approve Points")
    end
    click_link("Winter Formal")
end

Then("the user should see a register button") do
    #page.should have_button("Register")
end