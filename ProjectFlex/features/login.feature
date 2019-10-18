#Test login feature

Feature: login
    We want user to be greeted when they logged in
    So that the user knows when he/she is logged in
    So that they can access member pages
    
    Scenario: User is NOT logged in
      When I go to homepage
      Given I am NOT logged in
      Then I should see a login button and only About, Contact, and Staff pages
      
    Scenario: User is logged in
      Given I am logged in
      Then I should see a greeting message, logout button, and member pages will appear
      
    Scenario: User logs out
      When I log out
      Then I should see login button and member pages go away
      
      

      
      