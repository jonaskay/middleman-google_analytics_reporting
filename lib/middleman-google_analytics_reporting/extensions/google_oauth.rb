# Require core library
require 'middleman-core'

module Middleman
  module GoogleOauth
    class Extension < Middleman::Extension
      option :client_id, nil, "OAuth client ID for Google APIs"
      option :client_secret, nil, "OAuth client secret for Google APIs"
      option :token_store, nil, "Token store file name"

      attr_reader :client_id, :client_secret, :token_store

      def initialize(app, options_hash={}, &block)
        # Call super to build options from the options_hash
        super

        # Require libraries only when activated
        # require 'necessary/library'

        # set up your extension
        # puts options.my_option

        @client_id = options.client_id
        @client_secret = options.client_secret
        @token_store = options.token_store
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
