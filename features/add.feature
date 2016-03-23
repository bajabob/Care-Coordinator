Feature: Add Appointment

  As a patient or doctor
  So I can add an appointment
  I want to go to an add appointment page and create a new appointment

Scenario: When New Appointment button is clicked, new appointment page is rendered

  Given I am on the Care Coordinator home page
  When I press on New Appointment
  Then I should be on the New Appointment page

Scenario: When information is inputted into new appointment fields, and they are saved, then a new appointment is created

  Given I am on the New Appointment page
  When appointment information is inputted
  And Save Changes is clicked
  Then a new appointment is created
