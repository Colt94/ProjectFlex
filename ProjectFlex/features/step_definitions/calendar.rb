Given("the user is logged in") do
    #@username = "TestUser"
    visit "/#home"
    #find_button('Login')
    click_button('Login')
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
    click_button('Login')
end
When("the user goes to event page") do
    visit"/calendar"
end
Then("they should see a add event button") do
    page.should have_button("New Event")
end