# Middleman::GoogleAnalyticsReporting
[![Build Status](https://travis-ci.com/jonaskay/middleman-google_analytics_reporting.svg?branch=master)](https://travis-ci.com/jonaskay/middleman-google_analytics_reporting)

Print Google Analytics reports for your [Middleman](https://middlemanapp.com/) project inside your terminal.

## Installation
Add the following to your `Gemfile` and run `bundle install`:

```ruby
gem 'middleman-google_analytics_reporting',
  github: 'jonaskay/middleman-google_analytics_reporting'

gem 'gager-cli',
  github: 'jonaskay/gager-cli'

gem 'gager-core',
  github: 'jonaskay/gager-core'
```

### Enable Google Analytics Reporting API
`Middleman::GoogleAnalyticsReporting` uses the [Google Analytics Reporting API v4](https://developers.google.com/analytics/devguides/reporting/core/v4/) to retrieve the reports. You need to enable the Reporting API inside Google's API Console with the following steps:

1. Open the [Library page](https://console.developers.google.com/apis/library) inside the API Console.
2. Select the project associated with your application. Create a project if you do not have one already.
3. Use the **Library page** to find the Google Analytics Reporting API. Click on the API and enable it for your project.

### Create Authorization Credentials
`Middleman::GoogleAnalyticsReporting` uses OAuth 2.0 to access the Google Analytics Reporting API. You need to create the required credentials with the following steps:

1. Open the [Credentials page](https://console.developers.google.com/apis/credentials) in the API Console.
2. Click **Create credentials > OAuth client ID**.
3. Complete the form.
4. Use the **Credentials page** to copy the client ID and secret

## Configuration
Activate `google_oauth` and `google_analytics_reporting` inside your `config.rb`

```ruby
activate :google_oauth do |c|
  # Your OAuth 2.0 client credentials
  c.client_id = "MyClientId"
  c.client_secret = "MyClientSecret"

  # Your token store filename
  c.token_store = "MyTokenStore.yaml"
end

activate :google_analytics_reporting do |c|
  c.name = "MyReport"
  c.view_id = "MyViewId"
  c.date_ranges = [["2015-06-15", "2015-06-30"]]
  c.dimensions = ["ga:browser"]
  c.metrics = ["ga:sessions"]
end
```

## Reporting

Print your report:

```
$ middleman report
```

## Development

Install dependencies:

```
$ bundle install
```

Run tests:

```
$ rake test
```
