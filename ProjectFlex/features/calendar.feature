Feature: calendar
  As a faculty member of the student organization
  I want to be able to create events on the calendar page
  So that members can sign up, attend, and earn points
  
  Scenario: Member goes to calendar page
    Given the user is logged in
    When the user goes to the calendar page 
    Then the user should see a calendar with events displayed
    
  Scenario: Faculty adds an events
    Given the user has permissions
    When the user goes to event page
    Then they should see a add event button
    
    
  