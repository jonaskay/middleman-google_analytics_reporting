require "middleman-core"

Middleman::Extensions.register :middleman-google_analytics_reporting do
  require "my-extension/extension"
  MyExtension
end
