Feature: Export PDF

  As a patient or doctor
  So I can have a printable schedule
  I want to export a pdf of my schedule

Scenario: When an Appointment is clicked, appointment page is rendered

  Given I am an authenticated user
  And I am on the Care Coordinator home page
  When I click on "Export To PDF"
  Then I should get a PDF