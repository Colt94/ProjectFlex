=begin
Given("I am on the home screen and signed in") do
    visit "/#home"
    click_button('Login')
end
When("I click on Approve Points link") do
    click_link("Approve Points")
end
Then("I will see members pending point approval for attending a certain event_attendances") do
    page.has_table?("event_attendances")
end


When("I click on Calendar link") do
    visit "/#home"
    click_button('Login')
    click_link("Calendar")
end

Then("I will see a list of upcoming events") do
    page.has_table?("events")
end

When("I click on Forms") do
    visit "/#home"
    click_button('Login')
    click_link("Forms")
end
Then("I will see text that says 'Here are all of the forms.'") do
    page.should have_content("Here are all of the forms.")
end

When("I click on Marketplace") do
    visit "/#home"
    click_button('Login')
    click_link("Marketplace")
end
Then("I will see text that says 'See what other members are selling here!'") do
    page.should have_content("See what other members are selling here!")
end

When("I click on My points") do
    visit "/#home"
    click_button('Login')
    click_link("My Points")
end
Then("I should see text 'View your points here!'") do
    page.should have_content("View your points here!")
end

When("I click on My Registration") do
    visit "/#home"
    click_button('Login')
    click_link("My Registration")
end
Then("I should see text 'View your registrations here!'") do
    page.should have_content("View your registrations here!")
end
=end