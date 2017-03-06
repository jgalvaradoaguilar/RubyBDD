require 'capybara/cucumber'
require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'rspec/retry'

$TIMEOUT = 120
PageObject.default_page_wait = $TIMEOUT
PageObject.default_element_wait = $TIMEOUT

World(PageObject::PageFactory)

Before do
  # Set the browser (only Firefox in this example)
  @browser = Selenium::WebDriver.for :firefox
  @browser.manage.timeouts.implicit_wait = $TIMEOUT
  @browser.manage.timeouts.page_load = 120
  @browser.manage.window.maximize
  
  # Retry to open URL if it fails
  RSpec.configure do |config|
    # show retry status in spec process
    config.verbose_retry = true
    # Try twice (retry once)
    config.default_retry_count = 2
    # Only retry when Selenium raises Net::ReadTimeout
    config.exceptions_to_retry = [Net::ReadTimeout]
  end
  
end

After do |scenario|
  @browser.quit
end
