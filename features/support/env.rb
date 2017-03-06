require 'capybara/cucumber'
require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'

$TIMEOUT = 15
PageObject.default_page_wait = $TIMEOUT
PageObject.default_element_wait = $TIMEOUT

World(PageObject::PageFactory)

Before do
  # Set the browser (only Firefox in this example)
  @browser = Selenium::WebDriver.for :firefox
  @browser.manage.timeouts.implicit_wait = $TIMEOUT
  @browser.manage.timeouts.page_load = 120
  @browser.manage.window.maximize
  
  # Open URL and the test is retrayed once if it fails
  attempts = 0
  begin
    visit MainPage
  rescue Net::ReadTimeout
    if attempts == 0
      attempts += 1
      retry
    else
      raise
    end
  end
  
end

After do |scenario|
  @browser.quit
end
