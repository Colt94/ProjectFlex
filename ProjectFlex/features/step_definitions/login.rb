User.create(:name => "Colton", :permissions => "Exec", :net_id => "coltmo", :user_zone => "Service")

When("I go to homepage") do
    visit "/#home"
end

Given("I am NOT logged in") do
    Capybara::Session#reset!
end

Then("I should see a login button and only About, Contact, and Staff pages") do
 
    page.has_no_content?("Approve Points")
    page.has_no_content?("Calendar")
    page.has_no_content?("Marketplace")
    page.has_no_content?("My Points")
    page.has_no_content?("My Registration")
  
end

Given("I am logged in") do
    visit "/#home"
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        provider: 'google_oauth2',
        info: {
            email: 'coltmo@tamu.edu'
        }
    })
     
    #request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2] 
    click_link('Login with your TAMU Google account')
    
end

Then("I should see a greeting message, logout button, and member pages will appear") do
    page.should have_content("Hello, Colton! You are authenticated.")
    within('#smallScreen') do
        page.has_no_content?("Approve Points")
        page.has_no_content?("Calendar")
        page.has_no_content?("Marketplace")
        page.has_no_content?("My Points")
        page.has_no_content?("My Registration")
    end
    find_button('Logout')
end

When("I log out") do
    Capybara::Session#reset!
    #expect(page).to have_button('Logout', disabled: false)
end

Then("I should see login button and member pages go away") do
    #find_link('Login with your tamu Google account')
    
    #page.has_no_content?("Approve Points")
    #page.has_no_content?("Calendar")
    #page.has_no_content?("Marketplace")
    #page.has_no_content?("My Points")
    #page.has_no_content?("My Registration")
    
end