Feature: Add Comment

  As a patient or doctor
  So I can add a comment
  I want to go to an appointment page and add a new comment

Scenario: When an Appointment is clicked, appointment page is rendered

  Given I am an authenticated user
  And I am on the Care Coordinator home page
  When I press on an appointment
  Then I should be on an appointment page
  And I should see a Comments section

Scenario: When a comment is inputted and submitted, then a new comment is created

  Given I am an authenticated user
  And I am on an appointment page
  When comment information is inputted
  And I press "Submit"
  Then I should get a pop up
  And I should be on the Care Coordinator home page
