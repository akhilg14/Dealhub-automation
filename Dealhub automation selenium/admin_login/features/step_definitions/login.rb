require 'selenium-webdriver'
require 'rspec'
require 'rspec/expectations'

driver = Selenium::WebDriver.for(:chrome)

Before do
  driver.get "http://dealhub-staging.herokuapp.com/admins/sign_in"
end


Given(/^I am on the admin login page$/) do
  expect(driver.title).to eq('Deal Hub')
end

When(/^I enter email with (.*?) and password with (.*?)$/) do | email, password |
  driver.find_element(:id, "admin_email").send_keys(email)
  driver.find_element(:id, "admin_password").send_keys(password)
end

And (/^I click on the login button$/) do 
  driver.find_element(:name ,"commit").click
end

Then (/^I am on the admin user page$/) do
    expect(driver.find_element(:class, "flash").text).to eq("Signed in successfully.")
end

Then (/^I get an error message$/) do
  expect(driver.find_element(:class, "flash").text).to eq("Invalid email address or password.")
end

And (/^I logout$/) do
  driver.find_element(:link_text ,"Logout" ).click
end