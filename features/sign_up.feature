Feature: Sign up for account

  As a patient or doctor
  So I can access the site
  I want to go to a sign up page and create an account

Scenario: When the Sign Up link is clicked, sign up page is rendered

  Given I am on the Care Coordinator login page
  When I press on the Sign Up link
  Then I should be on the Sign Up page

Scenario: When information is inputted into fields, and they are saved, then account is created

  Given I am on the Sign Up page
  When account information is inputted
  And Make Account is clicked
  Then account is created

Scenario: When Make Account button is clicked, calendar page is rendered

  Given I am on the Sign Up page
  When I press on Make Account
  Then I should be on the Calendar page
