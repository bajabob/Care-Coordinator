Feature: Edit Care Provider

  As a patient or doctor
  So I can edit an care provider
  I want to go to an edit care provider page and edit an existing care provider

Scenario: When View Care Providers link is clicked, care provider list page is rendered

  Given I am an authenticated user
  And I am on the Care Coordinator home page
  When I click on "View Care Providers"
  Then I should be on the care providers page

Scenario: When Edit Care Provider button is pressed, edit care provider page is rendered

  Given I am an authenticated user
  And I am on the care provider page
  When I click on "Edit"
  Then I should be on the edit care provider page

Scenario: When information is inputted into fields, and they are saved, then care provider is updated

  Given I am an authenticated user
  And I am on the edit care provider page
  When care provider information is inputted
  And I press "Update Care Provider Info"
  Then I should get a pop up
  And I should be on the care providers page
