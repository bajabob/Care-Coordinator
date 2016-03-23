Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

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
  fill_in("appointment_title", :with => "test")
end

When(/^Save Changes is clicked$/) do
  click_button("Save Changes")
end

Then(/^a new appointment is created$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
