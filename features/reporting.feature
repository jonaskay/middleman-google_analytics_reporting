Feature: Reporting

  Scenario: App is missing :google_oauth activation
    Given a fixture app "missing-oauth-app"
    When I run `middleman report`
    Then the output should contain "Extension 'google_oauth' has not been activated. See https://github.com/jonaskay/middleman-google_analytics_reporting#configuration"
    And the exit status should be 1

  Scenario: :google_oauth activation is missing client_id
    Given a fixture app "missing-oauth-client-id-app"
    When I run `middleman report`
    Then the output should contain "'client_id' cannot be read or is missing from 'google_oauth'. See https://github.com/jonaskay/middleman-google_analytics_reporting#configuration"
    And the exit status should be 1

  Scenario: :google_oauth activation is missing client_secret
    Given a fixture app "missing-oauth-client-secret-app"
    When I run `middleman report`
    Then the output should contain "'client_secret' cannot be read or is missing from 'google_oauth'. See https://github.com/jonaskay/middleman-google_analytics_reporting#configuration"
    And the exit status should be 1

  Scenario: App is missing :google_analytics_reporting activation
    Given a fixture app "missing-reporting-app"
    When I run `middleman report`
    Then the output should contain "Extension 'google_analytics_reporting' has not been activated. See https://github.com/jonaskay/middleman-google_analytics_reporting#configuration"
    And the exit status should be 1
