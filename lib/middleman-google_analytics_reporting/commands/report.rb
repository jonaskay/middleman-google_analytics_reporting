require 'middleman-core/cli'

module Middleman
  module Cli
    class Report < Thor::Group
      include Thor::Actions

      NIL_GOOGLE_OAUTH_EXTENSION = "Extension 'google_oauth' has not been activated"
      NIL_GOOGLE_ANALYTICS_REPORTING_EXTENSION = "Extension 'google_analytics_reporting' has not been activated"

      def report
        app = Middleman::Application.new
        unless (oauth = app.extensions[:google_oauth])
          abort(NIL_GOOGLE_OAUTH_EXTENSION)
        end
        unless (reporting = app.extensions[:google_analytics_reporting])
          abort(NIL_GOOGLE_ANALYTICS_REPORTING_EXTENSION)
        end

        gager = Gager::Cli::Application.new(*oauth.params)
        gager.report(reporting.params)
      end
    end

    # Add to CLI
    Base.register(Middleman::Cli::Report, 'report', 'report', 'Get Google Analytics reports')
  end
end
