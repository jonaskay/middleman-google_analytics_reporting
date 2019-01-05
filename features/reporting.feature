Feature: Reporting

  Scenario: App is valid
    Given a fixture app "example-app"
    When I run `middleman report`
    Then the exit status should be 0

  Scenario: App is missing :google_oauth activation
    Given a fixture app "missing-oauth-app"
    When I run `middleman report`
    Then the output should contain "Extension 'google_oauth' has not been activated"
    And the exit status should be 1

  Scenario: App is missing :google_analytics_reporting activation
    Given a fixture app "missing-reporting-app"
    When I run `middleman report`
    Then the output should contain "Extension 'google_analytics_reporting' has not been activated"
    And the exit status should be 1
