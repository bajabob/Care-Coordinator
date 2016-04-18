When(/^comment information is inputted$/) do
  fill_in("comment", :with => "Test Comment")
end

Then(/^I should see a Comments section$/) do
  if page.respond_to? :should
    page.should have_content("Comments")
  end
end
