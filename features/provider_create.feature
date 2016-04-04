Feature: Create Care Provider

  As a patient or doctor
  So I can add a provider
  I want to go to the create provider page and create a new provider

Scenario: When View Care Providers link is clicked, care provider list page is rendered

  Given I am an authenticated user
  And I am on the Care Coordinator home page
  When I click on "View Care Providers"
  Then I should be on the care providers page

Scenario: When New button is pressed, Create Care Provider page is rendered

  Given I am an authenticated user
  And I am on the care providers page
  When I press "New"
  Then I should be on the new care provider page

Scenario: When information is inputted into new care provider fields, and they are saved, then a new care provider is created

  Given I am an authenticated user
  And I am on the new care provider page
  When new care provider information is inputted with name "Scott and White"
  And I press "Save Changes"
  Then a new care provider with name "Scott and White" is created
  And I should be on the Care Coordinator home page
  And I should get a pop up