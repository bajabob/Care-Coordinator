Feature: Login to Application

  As a patient or doctor
  So I can login to application
  I want to go to enter a correct email address and password combination

Scenario: When correct login information is entered, a user logs in successfully

  Given I am on the login page
  When I fill Email Address with "jfairchild23@gmail.com"
  And I fill Password with "cc2016"
  And I press "Login"
  Then I should on the Care Coordinator home page

Scenario: When incorrect login information is entered, a user cannot log in

  Given I am on the login page
  When I fill Email Address with "jfairchild23@gmail.com"
  And I fill Password with "6102cc"
  And I press "Login"
  Then I should have a warning
  And I should be on the login page