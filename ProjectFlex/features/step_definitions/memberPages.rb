When("I click on Forms") do
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
    within('#sidebar') do
        click_link("Forms")
    end
end
Then("I will see text that says 'Here are all of the forms.'") do
    page.should have_content("Here are all of the forms.")
end

When("I click on Marketplace") do
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
    within('#sidebar') do
        click_link("Marketplace")
    end
end
Then("I will see text that says 'See what other members are selling here!'") do
    page.should have_content("See what other members are selling here!")
end

When("I click on My points") do
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
Then("I should see text 'View your points here!'") do
    #page.should have_content("View your points here!")
end
