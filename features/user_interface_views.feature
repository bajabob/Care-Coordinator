Feature: View daily, weekly, and monthly schedule

  As a patient or doctor
  So I can view the daily, weekly, and monthly schedule
  I want to switch between views

Scenario: Going to weekly view from daily view

  Given I am on the Care Coordinator home page
  When I follow Weekly
  Then I should be on the weekly view page

Scenario: Going to monthly view from daily view

Given I am on the Care Coordinator home page
  When I follow Monthly
  Then I should be on the monthly view page
