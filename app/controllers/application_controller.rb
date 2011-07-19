class ApplicationController < ActionController::Base
  protect_from_forgery
  USER_NAME, PASSWORD = "dhh", "secret"
  before_filter :authenticate

  
  
  def logged_in?
    true
  end
  private
    def authenticate
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == USER_NAME && password == PASSWORD
      end
    end
        
end
