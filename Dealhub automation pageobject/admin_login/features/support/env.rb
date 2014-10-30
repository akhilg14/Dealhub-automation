require 'selenium-webdriver'
require 'rspec'
require 'rspec/expectations'
require 'page-object'
require 'page-object/page_factory'

World(PageObject::PageFactory)
driver = Selenium::WebDriver.for (:chrome)

Before do
@browser = driver
@admin_login = AdminLogin.new(@browser)
visit_page AdminLogin
end

at_exit do
  driver.quit
end