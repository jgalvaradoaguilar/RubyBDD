require 'capybara/cucumber'
require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'

$TIMEOUT = 10
PageObject.default_page_wait = $TIMEOUT
PageObject.default_element_wait = $TIMEOUT

World(PageObject::PageFactory)

Before do
  # Set the browser (only Firefox in this example)
  @browser = Selenium::WebDriver.for :firefox
  @browser.manage.timeouts.implicit_wait = $TIMEOUT
  @browser.manage.timeouts.page_load = 120
  @browser.manage.window.maximize
end

After do |scenario|
  @browser.quit
end
