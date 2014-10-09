# mr-fetch

Feature: Fetch pages in "pageset" mode
  As a user of mr-fetch
  I want it to fetch the HTML source for a bunch of URLs I provide it
  So that other tools in the mister-roboto suite can further analyze the source later

  Scenario: No URL provided
    Given I have no URLs to fetch
    When I run mr-fetch without providing any stdin
    Then mr-fetch should not do anything

  Scenario: Multiple valid URLs provided
    Given I have multiple URLs to fetch
    When I run mr-fetch passing multiple URLs via stdin
		And all of the URLs are valid
    Then mr-fetch should fetch all of the URLs provided
		And store the HTML source

  Scenario: Multiple URLs provided, at least one of them are invalid
    Given I have multiple URLs to fetch
    When I run mr-fetch passing multiple URLs via stdin
		And at least one of the URLs is invalid
    Then mr-fetch should report which URLs were not parseable
