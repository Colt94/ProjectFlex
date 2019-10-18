
When("I go to homepage") do
    visit "/#home"
end

Given("I am NOT logged in") do
    Capybara::Session#reset!
end

Then("I should see a login button and only About, Contact, and Staff pages") do
    page.should have_button('Login')
    page.should have_content("About")
    page.should have_content("Contact")
    page.should have_content("Staff")
    page.has_no_content?("Approve Points")
    page.has_no_content?("Calendar")
    page.has_no_content?("Marketplace")
    page.has_no_content?("My Points")
    page.has_no_content?("My Registration")
end

Given("I am logged in") do
    #@username = "TestUser"
    visit "/#home"
    #find_button('Login')
    click_button('Login')
end

Then("I should see a greeting message, logout button, and member pages will appear") do
    page.should have_content("Hello, username! You are authenticated.")
    page.should have_content("Approve Points")
    page.should have_content("Calendar")
    page.should have_content("Marketplace")
    page.should have_content("My Points")
    page.should have_content("My Registration")
    find_button('Logout')
end

When("I log out") do
    visit "/#home"
    #find_button('Login')
    click_button('Login')
    click_button('Logout')
end

Then("I should see login button and member pages go away") do
    find_button('Login')
    page.should have_button('Login')
    page.should have_content("About")
    page.should have_content("Contact")
    page.should have_content("Staff")
    page.has_no_content?("Approve Points")
    page.has_no_content?("Calendar")
    page.has_no_content?("Marketplace")
    page.has_no_content?("My Points")
    page.has_no_content?("My Registration")
end
