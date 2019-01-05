require 'middleman-core/cli'

module Middleman
  module Cli
    class Report < Thor::Group
      include Thor::Actions

      def report
      end
    end

    # Add to CLI
    Base.register(Middleman::Cli::Report, 'report', 'report', 'Get Google Analytics reports')
  end
end
