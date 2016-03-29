Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

#Add Appointment Tests

Then(/^I should see a calendar$/) do
  page.has_xpath?("//div[@class='cal-month-box']")
end

Then(/^I should see events$/) do
  page.has_xpath?("//div[@id='eventlist']")
end

When(/^I press on New Appointment$/) do
  click_link("New Appointment")
end

Then(/^I should be on the New Appointment page$/) do
  if page.respond_to? :should
    page.should have_content("New Appointment")
  else
    assert page.has_content?("New Appointment")
  end
end

When(/^appointment information is inputted$/) do
  fill_in("appointment_description", :with => "test")
end

When(/^I press on Save Changes$/) do
  click_button("Save Changes")
end

Then(/^a new appointment is created$/) do
   if page.respond_to? :should
    page.should have_content("Today")
  else
    assert page.has_content?("Today")
  end
end

#Edit Appointment Tests

When(/^I press on an appointment$/) do
  visit path_to("appointment")
end

Then(/^I should be on an appointment page$/) do
  if page.respond_to? :should
    page.should have_content("Details about")
  else
    assert page.has_content?("Details about")
  end
end

When(/^I press on Edit$/) do
  click_link("Edit")
end

Then(/^I should be on the Update Appointment page$/) do
  if page.respond_to? :should
    page.should have_content("Update Appointment")
  else
    assert page.has_content?("Update Appointment")
  end
end

When(/^Update Appointment Info is clicked$/) do
  click_button("Update Appointment Info")
end

Then(/^appointment is updated$/) do
  if page.respond_to? :should
    page.should have_content("Details about")
  else
    assert page.has_content?("Details about")
  end
end

#Delete Appointment Tests

When(/^I press on Delete$/) do
  click_button("Delete")
end

Then(/^appointment is deleted$/) do
  if !(page.respond_to? :should)
    true
  else
    false
  end
end

#Sign Up Tests

When(/^I press on the Sign Up link$/) do
  click_link("Sign Up")
end

Then(/^I should be on the Sign Up page$/) do
  if page.respond_to? :should
    page.should have_content("Create New Account")
  else
    assert page.has_content?("Create New Account")
  end
end

When(/^account information is inputted$/) do
  fill_in("first_name_new", :with => "john")
  fill_in("last_name_new", :with => "smith")
  fill_in("email_new", :with => "derp@gmail.com")
  fill_in("phone_new", :with => "1234567890")
  fill_in("password_new", :with => "password")
  fill_in("password_confirm_new", :with => "password")
end

When(/^Make Account is clicked$/) do
  click_button("Make Account")
end

Then(/^account is created$/) do
  if page.respond_to? :should
    page.should have_content("john")
  else
    assert page.has_content?("john")
  end
end

When(/^incorrect password information is inputted$/) do
  fill_in("first_name_new", :with => "john")
  fill_in("last_name_new", :with => "smith")
  fill_in("email_new", :with => "derp@gmail.com")
  fill_in("phone_new", :with => "1234567890")
  fill_in("password_new", :with => "pass")
  fill_in("password_confirm_new", :with => "word")
end

Then(/^Login page is rerendered$/) do
  if page.respond_to? :should
    page.should have_content("Care Coordinator")
  else
    assert page.has_content?("Care Coordinator")
  end
end

When(/^I press on Make Account$/) do
  click_button("Make Account")
end

Then(/^I should be on the Calendar page$/) do
   if page.respond_to? :should
    page.should have_content("Today")
  else
    assert page.has_content?("Today")
  end
end