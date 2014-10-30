Given(/^I am on the admin login page$/) do
  # visit_page AdminLogin
  expect(@browser.title).to eq('Deal Hub')
end

When(/^I enter email with (.*?) and password with (.*?)$/) do | email, password |
  @admin_login.login_with(email, password)
end

And (/^I click on the login button$/) do 
  @admin_login.login
end

Then (/^I am on the admin user page$/) do
    @admin_login.message_success?
end

Then (/^I get an error message$/) do
  @admin_login.message_fail?
end

And (/^I logout$/) do
  @admin_login.logout
end