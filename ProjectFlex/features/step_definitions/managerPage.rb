

Given("I am logged in as an Exec") do
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
end

When("I am on the homepage") do
    within('#smallScreen') do
        expect(page).to have_content('Manage Users')
    end
end

Then('I should see a link to manage users') do
    within('#smallScreen') do
        expect(page).to have_content('Manage Users')
    end
end
