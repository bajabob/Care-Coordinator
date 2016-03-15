Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then(/^I should see a calendar$/) do
  page.has_xpath?("//div[@class='cal-month-box']")
end

Then(/^I should see events$/) do
  page.has_xpath?("//div[@id='eventlist']")
end
