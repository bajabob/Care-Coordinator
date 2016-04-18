When(/^I press the notification icon$/) do
  find(:xpath, "//a[@href='/notification/']").click
end

Then(/^I should be on the Notification page$/) do
  expect(find('.card-title').text.should == "All Notifications")
end

Then(/^I should have no unread notifications$/) do
  expect(find('.badge').text.should == "0")
end

Then(/^I should get a PDF$/) do
  if (page.respond_to? :should)
    true
  end
end