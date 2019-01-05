# Require core library
require 'middleman-core'

module Middleman
  module GoogleAnalyticsReporting
    class Extension < Middleman::Extension
      option :name, nil, "Report name"
      option :view_id, nil, "View ID"
      option :date_ranges, nil, "Date range"
      option :metrics, nil, "Metrics"
      option :dimensions, nil, "Dimensions"

      attr_reader :name, :view_id, :date_ranges, :metrics, :dimensions

      def initialize(app, options_hash={}, &block)
        # Call super to build options from the options_hash
        super

        # Require libraries only when activated
        # require 'necessary/library'

        # set up your extension
        # puts options.my_option

        @name = options.name
        @view_id = options.view_id
        @date_ranges = options.date_ranges
        @metrics = options.metrics
        @dimensions = options.dimensions
      end

      def after_configuration
        # Do something
      end

      # A Sitemap Manipulator
      # def manipulate_resource_list(resources)
      # end

      # helpers do
      #   def a_helper
      #   end
      # end
    end
  end
end
