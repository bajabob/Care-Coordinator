Feature: Edit Appointment

  As a patient or doctor
  So I can edit an appointment
  I want to go to an edit appointment page and edit an existing appointment

@rack_test
Scenario: When an Appointment button is clicked, appointment page is rendered

  Given I am on the Care Coordinator home page
  When I press on an Appointment
  Then I should be on the Appointment page

Scenario: When Edit Appointment button is clicked, edit appointment page is rendered

  Given I am on the appointment page
  When I press on Edit 
  Then I should be on the Update Appointment page

Scenario: When information is inputted into fields, and they are saved, then appointment is updated

  Given I am on the Update Appointment page
  When appointment information is inputted
  And Update Appointment Info is clicked
  Then appointment is updated
