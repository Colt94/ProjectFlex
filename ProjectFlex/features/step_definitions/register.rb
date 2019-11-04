Given("the user has logged in") do
    visit "/#home"
    find_button('Login').click
end
When ("the user goes to his registration page") do
    within('#sidebar') do
        click_link('My Registration')
    end
end
Then ("the user should see all events that the user registered for") do
    
    page.should have_content("My Registration") 
    page.should have_content("Fundraising:")
    page.should have_content("Social:")
    page.should have_content("Service:")
    page.should have_content("Leadership Dev:")
    page.should have_content("PR:")
end

Given("the user is logged in and on the calendar page") do
    visit "/#home"
    find_button('Login').click
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
    page.should have_button("Register")
end