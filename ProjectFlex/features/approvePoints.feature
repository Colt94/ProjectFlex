Feature:
  As an faculty member of the organization
  We want to allow faculty to approve event attendance for members
  So that they can give points to members who attended
  
  
  Scenario:
    Given that user is logged in with permissions
    When they go to approve points page
    Then they should see the contents of event list table
    
  Scenario:
    Given the user has permissions and is on aprrove points page
    When they click on a specfic event
    Then the page should display users who need approval for that event