Feature: pages
  As a website
  We want the user to able to navigate between pages
  So that they can easily view different information
  
  
  Scenario:
    Given I am on the home screen
    When I click on About link
    Then I will see About Flex
    
  Scenario:
    When I click on Contact link
    Then I will see Contact us!
    
  Scenario:
    When I click on Staff link
    Then I will see Flex staff
