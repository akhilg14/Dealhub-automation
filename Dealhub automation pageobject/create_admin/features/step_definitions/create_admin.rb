Given(/^I am on the admin login page$/) do 
@admin_create.login_with("admin@dealhub.com", "admin123")
@admin_create.login
end

When(/^I click on create new admin$/) do
@admin_create.createadmin
end

Then(/^I should be on Add new admin page$/) do
  @admin_create.create?
end

When(/^I enter name with (.*?) and email with (.*?)$/) do |name , email|
@admin_create.create_with(name, email)
end

And(/^I click on Create Admin$/) do
@admin_create.create
end

Then(/^I should get a success message of that (.*)$/) do |name|
AdminCreate.create_validation(name)
@admin_create.message_success?
end

And(/^I logout$/) do
@admin_create.logout
end
