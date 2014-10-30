require 'selenium-webdriver'
require 'rspec'
require 'rspec/expectations'
require 'page-object'
require 'page-object/page_factory'

World(PageObject::PageFactory)
driver = Selenium::WebDriver.for (:chrome)

Before do
@browser = driver
@admin_create = AdminCreate.new(@browser)
visit_page AdminCreate
end

at_exit do
  driver.quit
end