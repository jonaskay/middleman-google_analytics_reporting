require 'middleman-core/cli'

module Middleman
  module Cli
    class Report < Thor::Group
      include Thor::Actions

      def report
        app = Middleman::Application.new
        unless (oauth = app.extensions[:google_oauth])
          handle_unactived_extension('google_oauth')
        end
        unless (reporting = app.extensions[:google_analytics_reporting])
          handle_unactived_extension('google_analytics_reporting')
        end

        validate_oauth(oauth)

        gager = Gager::Cli::Application.new(*oauth.params)
        gager.report(reporting.params)
      end

      private

      def validate_oauth(oauth)
        handle_missing_param('client_id') if oauth.client_id.nil?
        handle_missing_param('client_secret') if oauth.client_secret.nil?
      end

      def handle_missing_param(param)
        error_message = error_message("'#{param}' cannot be read or is missing from 'google_oauth'")
        abort(error_message)
      end

      def handle_unactived_extension(extension)
        error_message = error_message("Extension '#{extension}' has not been activated")
        abort(error_message)
      end

      def error_message(message)
        message + '. See https://github.com/jonaskay/middleman-google_analytics_reporting#configuration'
      end
    end

    # Add to CLI
    Base.register(Middleman::Cli::Report, 'report', 'report', 'Get Google Analytics reports')
  end
end
