activate :google_oauth do |c|
  c.client_id = nil
  c.client_secret = "MyClientSecret"
  c.token_store = "MyTokenStore"
end

activate :google_analytics_reporting do |c|
  c.name = "MyReport"
  c.view_id = "MyViewId"
  c.date_ranges = [["2015-06-15", "2015-06-30"]]
  c.dimensions = ["ga:browser"]
  c.metrics = ["ga:sessions"]
end
