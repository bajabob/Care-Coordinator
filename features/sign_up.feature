Feature: Sign up for account

  As a patient or doctor
  So I can access the site
  I want to go to a sign up page and create an account

Scenario: When the Sign Up link is clicked, sign up page is rendered

  Given I am on the login page
  When I click on "Sign Up"
  Then I should be on the Sign Up page

Scenario: When information is inputted into fields, and they are saved, then account is created

  Given I am on the Sign Up page
  When account information is inputted
  And I press "Make Account"
  Then account is created

Scenario: When password is inputted into fields, and they are not the same, then Login page is rerendered

  Given I am on the Sign Up page
  When incorrect password information is inputted
  And I press "Make Account"
  Then I should on the login page

Scenario: When Make Account button is clicked, calendar page is rendered

  Given I am on the Sign Up page
  When I press "Make Account"
  Then I should be on the Care Coordinator home page
