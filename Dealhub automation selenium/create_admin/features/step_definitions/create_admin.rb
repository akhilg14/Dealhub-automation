require 'selenium-webdriver'
require 'rspec'
require 'rspec/expectations'

driver = Selenium::WebDriver.for(:chrome)
Before do
driver.get "http://dealhub-staging.herokuapp.com/admins/sign_in"
end

Given(/^I am on the admin login page$/) do 
  # driver.get "http://dealhub-staging.herokuapp.com/admins/sign_in"
  driver.find_element(:id, "admin_email").send_keys("admin@dealhub.com")
  driver.find_element(:id, "admin_password").send_keys("admin123")
  driver.find_element(:name ,"commit").click
end

When(/^I click on create new admin$/) do
  driver.find_element(:link_text, "Create New Admin").click
end

Then(/^I should be on Add new admin page$/) do
  expect(driver.find_element(:css ,"#main h2").text).to eq('Add New Admin')
end

When(/^I enter name with (.*?) and email with (.*?)$/) do |name , email|
  driver.find_element(:id, "admin_name").send_keys(name)
  driver.find_element(:id, "admin_email").send_keys(email)
end

And(/^I click on Create Admin$/) do
  driver.find_element(:name, "commit").click
end

Then(/^I should get a success message of that (.*)$/) do |name|
  expect(driver.find_element(:class , "flash").text).to eq("#{name} user has been created")
end

And(/^I logout$/) do
  driver.find_element(:link_text ,"Logout" ).click
end
