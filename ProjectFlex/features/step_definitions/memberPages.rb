When("I click on Forms") do
    visit "/#home"
    click_button('Login')
    within('#sidebar') do
        click_link("Forms")
    end
end
Then("I will see text that says 'Here are all of the forms.'") do
    page.should have_content("Here are all of the forms.")
end

When("I click on Marketplace") do
    visit "/#home"
    click_button('Login')
    within('#sidebar') do
        click_link("Marketplace")
    end
end
Then("I will see text that says 'See what other members are selling here!'") do
    page.should have_content("See what other members are selling here!")
end

When("I click on My points") do
    visit "/#home"
    click_button('Login')
    within('#sidebar') do
        click_link("My Points")
    end
end
Then("I should see text 'View your points here!'") do
    page.should have_content("View your points here!")
end
