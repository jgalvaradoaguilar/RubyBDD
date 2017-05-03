Given(/^an user on the Youtube page$/) do
  visit MainPage
end

When(/^user makes a search with the content "([^"]*)"$/) do |content_to_search|
  on(MainPage) do |page|
    page.content_to_search(content_to_search)
  end
end

When(/^user clicks on Search button$/) do
  on(MainPage).search_button
end

Then(/^user should see any information$/) do
  sleep 2
  #Test commit 03 may 2017
  sleep 3
end
