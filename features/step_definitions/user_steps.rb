Given(/^I have a user with this information, "(.*?)","(.*?)", "(.*?)", "(.*?)"$/) do |name, last_name, mail, password|
  user = FactoryGirl.create(:user, name: name, last_name: last_name, mail: mail, password: password)
end

When(/^I (?:go to|am on) the list of users/) do
  visit '/users'
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content arg1
end

Given(/^I have no users$/) do
  User.all.count.should == 0
end

When(/^I (?:click on|press) "(.*?)"$/) do |arg1|
  click_on arg1
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2 
end

Then(/^I should have (\d+) user.*/) do |arg1|
  User.all.count.should == arg1.to_i
end

Then(/^The last user should have "(.*?)" as password$/) do |arg1|
  User.last.password.should == arg1
end
