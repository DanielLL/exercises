Given(/^I have a user with this information, "(.*?)","(.*?)", "(.*?)", "(.*?)"$/) do |name, last_name, mail, password|
  user = FactoryGirl.create(:user, name: name, last_name: last_name, mail: mail, password: password)
end

When(/^I (?:go to|am on) the list of users/) do
  visit '/users'
end

Then(/^I should see "(.*?)"$/) do |content|
  expect(page).to have_content content
end

Then(/^I should see not "(.*?)"$/) do |content|
  expect(page).to have_no_content(content)
end

Given(/^I have no users$/) do
  User.all.count.should == 0
end

When(/^I (?:click on|press) "(.*?)"$/) do |element|
  click_on element
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, with: value
end

Then(/^I should have (\d+) user.*/) do |count|
  User.all.count.should == count.to_i
end

Then(/^The last user should have "(.*?)" as password$/) do |password|
  User.last.password.should == password
end


When(/^I confirm the action$/) do
  page.driver.browser.switch_to.alert.accept
end
