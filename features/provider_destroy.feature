Feature: Destroy Care Provider

  As a patient or doctor
  So I can delete an care provider
  I want to go to an care provider page and delete a care provider

Scenario: When View Care Providers link is clicked, care provider list page is rendered

  Given I am an authenticated user
  And I am on the Care Coordinator home page
  When I click on "View Care Providers"
  Then I should be on the care providers page

Scenario: When Delete button is pressed, care provider is deleted

  Given I am an authenticated user
  And I am on the care providers page
  When I press "Delete"
  Then care provider is deleted
  And I am on the Care Coordinator home page