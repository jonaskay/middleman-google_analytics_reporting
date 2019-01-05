require "middleman-core"
require "middleman-google_analytics_reporting/commands/report"

Middleman::Extensions.register :google_oauth do
  require "middleman-google_analytics_reporting/extensions/google_oauth"
  Middleman::GoogleOauth::Extension
end

Middleman::Extensions.register :google_analytics_reporting do
  require "middleman-google_analytics_reporting/extensions/google_analytics_reporting"
  Middleman::GoogleAnalyticsReporting::Extension
end
