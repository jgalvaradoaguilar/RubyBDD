class MainPage
  include PageObject

  page_url("https://www.youtube.com/")
  text_field(:search_term, :id => 'masthead-search-term')
  button(:search_button, :id => 'search-btn')

  def content_to_search(content)
    self.search_term=content
  end

end
