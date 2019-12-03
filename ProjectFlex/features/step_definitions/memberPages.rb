When("I click on Forms") do
    visit "/#home"
    
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        provider: 'google_oauth2',
        info: {
            email: 'coltmo@tamu.edu'
        }
    })
     
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    
    click_link("Login with your TAMU Google account")
    within('#smallScreen') do
        click_link("Forms")
    end
end
Then("I will see text that says 'Here are all of the forms.'") do
    page.should have_content("Here are all of the forms.")
end

When("I click on My points") do
    visit "/#home"
    
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        provider: 'google_oauth2',
        info: {
            email: 'coltmo@tamu.edu'
        }
    })
     
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    
    click_link("Login with your TAMU Google account")
    within('#smallScreen') do
        #print page.html
        #click_link("My Points")
    end
end
Then("I should see text 'View your points here!'") do
    
    #page.should have_content("View your points here!")
end
