Feature: Notifications

  As a patient or doctor
  So I can see if any changes have been made to an appointment's status
  I want to go to a notifications page and view the notification

Scenario: When Notification icon is clicked, notificaiton is rendered

  Given I am an authenticated user
  And I am on the Care Coordinator home page
  When I press the notification icon
  Then I should be on the Notification page
