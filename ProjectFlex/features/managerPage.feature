Feature: accountManager
  As a Exec flex member
  I want to be able to see a list of all members
  So that I can add,update,delete accounts
  
  Scenario:
    Given I am logged in as an Exec
    When I am on the homepage
    Then I should see a link to manage users