Feature: Search on Youtube
  As a website user
  In order to access the content about a scientist
  I need to make a search

  Scenario Outline: General search
    Given an user on the Youtube page
    When user makes a search with the content "<scientist>"
      And user clicks on Search button
    Then user should see any information
    #test commit

    Examples:
      | scientist |
      | tesla     |
      | dirac     |
