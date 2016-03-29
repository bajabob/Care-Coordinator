Feature: Logout of Application

  As a patient or doctor
  So I can logout of the application
  I want to click a button that logs me out

Scenario: When logout is clicked, a user is taken to login page

  Given I am an authenticated user
  And I am on the Care Coordinator home page
  When I click on "Logout"
  Then I should get a logout pop up
  And I should be on the login page