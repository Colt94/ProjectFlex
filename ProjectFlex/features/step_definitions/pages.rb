Given("I am on the home screen") do
    visit "/#home"
end

When("I click on About link") do
    click_link('About')
end

Then("I will see About Flex") do
    page.should have_content("About FLEX")
end

When("I click on Contact link") do
    visit "/#home"
    click_link("Contact")
end

Then("I will see Contact us!") do
    page.should have_content("Contact us!")
end

When("I click on Staff link") do
    visit "/#home"
    click_link("Staff")
end

Then("I will see Flex staff") do
    page.has_table?('users')
end

