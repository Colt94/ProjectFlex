Feature:
  As a member who wants to be involved with the organization
  I want to be able to register for upcoming events
  So that I can attened an receive points for the events
  
  
  Scenario:
    Given the user has logged in 
    When the user goes to his registration page
    Then the user should see all events that the user registered for
    
    
  Scenario:
    Given the user is logged in and on the calendar page
    When the user clicks a specific event
    Then the user should see a register button