# mr-fetch

Feature: Fetch pages in "oneshot" mode
  As a user of mr-fetch
  I want it to fetch the HTML source for a URL I provide it
  So that other tools in the mister-roboto suite can further analyze the source later

  Scenario: No URL provided
    Given I have no URLs to fetch
    When I run mr-fetch without passing any arguments
    Then mr-fetch should not do anything

  Scenario: Single valid URL provided
    Given I have single URL to fetch
    When I run mr-fetch with a single URL as an argument
		And that URL is valid
    Then mr-fetch should fetch only one URL
		And store the HTML source

  Scenario: Single invalid URL provided
    Given I have single URL to fetch
    When I run mr-fetch with a single URL as an argument
		And that URL is invalid
    Then mr-fetch should report an error trying to parse the URL
