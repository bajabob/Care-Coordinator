Feature: Destroy Appointment

  As a patient or doctor
  So I can delete an appointment
  I want to go to an appointment page and delete a new appointment

Scenario: When an Appointment button is clicked, appointment page is rendered

  Given I am on the Care Coordinator home page
  When I press on an appointment
  Then I should be on an appointment page

Scenario: When Delete button is clicked, appointment is deleted

  Given I am on the appointment page
  When I press on Delete
  Then appointment is deleted
  And I am on the Care Coordinator home page