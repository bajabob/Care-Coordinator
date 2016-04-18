# Login Step Definitions

When(/^I fill Email Address with "([^"]*)"$/) do |arg1|
  fill_in('Email Address', :with => arg1)
end

When(/^I fill Password with "([^"]*)"$/) do |arg1|
  fill_in('Password', :with => arg1)
end

Then(/^I should be on the Care Coordinator home page$/) do
  expect(find('.page-header'))
end

Then(/^I should have a warning$/) do
  expect(find('.alert-warning'))
end

Then(/^I should be on the login page$/) do
  expect(find('.form-signin'))
end

#Sign Up Tests

Then(/^I should be on the Sign Up page$/) do
  expect(find('.form-submit-account'))
end

When(/^account information is inputted$/) do
  fill_in("first_name_new", :with => "john")
  fill_in("last_name_new", :with => "smith")
  fill_in("email_new", :with => "derp@gmail.com")
  fill_in("phone_new", :with => "1234567890")
  fill_in("password_new", :with => "password")
  fill_in("password_confirm_new", :with => "password")
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

Then(/^I should on the login page$/) do
  expect(find('.form-signin'))
end