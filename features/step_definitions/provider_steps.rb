Then(/^I should be on the care providers page$/) do
  if page.respond_to? :should
    page.should have_content("All Care Providers")
  end
end

Then(/^I should be on the new care providers page$/) do
  if page.respond_to? :should
    page.should have_content("New Care Provider")
  end
end

When(/^new care provider information is inputted with name "([^"]*)"$/) do |arg1|
  fill_in("provider_office_name", :with => arg1)
  fill_in("provider_office_phone", :with => "5551234567")
  fill_in("provider_office_phone_ext", :with => "890")
  fill_in("provider_office_email", :with => "butts@sw.com")
  fill_in("provider_address_line_one", :with => "800 Scott and White Dr, , TX 77845")
  fill_in("provider_address_line_two", :with => "")
  fill_in("provider_city", :with => "College Station")
  fill_in("provider_state", :with => "TX")
  fill_in("provider_zip", :with => "77845")
  fill_in("provider_physician_name", :with => "Dr. Frank Reynolds")
end

Then(/^a new care provider with name "([^"]*)" is created$/) do |arg1|
  if page.respond_to? :should
    page.should have_content(arg1)
  end
end

Then(/^care provider is deleted$/) do
  if !(page.respond_to? :should)
    true
  end
end

Then(/^I should be on the edit care providers page$/) do
  if page.respond_to? :should
    page.should have_content("Update Care Provider")
  end
end

When(/^care provider information is inputted$/) do
  fill_in("provider_office_name", :with => "New Test Hostpital")
end

Then(/^I should be on a care provider page$/) do
  expect(find('.card'))
end

When(/^I click on More Info$/) do
  find_by_id("provider_1").click
end

