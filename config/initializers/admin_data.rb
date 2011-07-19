AdminData.config do |config|
  config.is_allowed_to_view = lambda {|controller| controller.send('logged_in?') }
  config.is_allowed_to_update = lambda {|controller| controller.send('logged_in?') }
  config.number_of_records_per_page = 50
  config.drop_down_for_associations = false
end