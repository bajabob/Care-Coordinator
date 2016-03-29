Feature: View daily, weekly, and monthly schedule

  As a patient or doctor
  So I can view the daily, weekly, and monthly schedule
  I want to switch between views

Scenario: When the homepage is loaded, a calendar is rendered.

  Given I am an authenticated user
  And I am on the Care Coordinator home page
  Then I should see a calendar

Scenario: A user's events should be displayed in a column

  Given I am an authenticated user
  And I am on the Care Coordinator home page
  Then I should see events
