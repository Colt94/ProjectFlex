Given("that user is logged in with permissions") do
    visit "/login"
    find_button('Login').click
end
When("they go to approve points page") do
    #find('div#sidebar col-2').click_link('Approve Points')
    page.should have_content("Hello, Grant! You are authenticated.")
    #find_button('Logout')
    #within('#sidebar') do
        #click_link('Approve Points')
    #end

end
Then("they should see the contents of event list table") do
    page.has_table?("events")
end