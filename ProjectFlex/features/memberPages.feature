Feature: memberPages
  As a website
  We want the user to able to navigate between the member pages
  So that they can easily view/interact with member information
  
  Scenario:
    Given I am on the home screen and signed in
    When I click on Approve Points link
    Then I will see members pending point approval for attending a certain event_attendances

  Scenario:
    When I click on Calendar link
    Then I will see a list of upcoming events
    
  Scenario:
    When I click on Forms
    Then I will see text that says 'Here are all of the forms.'
    
  Scenario:
    When I click on Marketplace
    Then I will see text that says 'See what other members are selling here!'
    
  Scenario:
    When I click on My points
    Then I should see text 'View your points here!'
    
  Scenario:
    When I click on My Registration
    Then I should see text 'View your registrations here!'