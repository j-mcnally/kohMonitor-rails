class ApplicationController < ActionController::Base
  
  # This is the standard application controller. This should be used for the
  # application landing page, usually it will not require authentication
  
  protect_from_forgery
  
  def index
    check_session_status
  end
  
  # Private methods
  private
    # Before we run the controller, let's check if the user has a valid session
    # if so, we'll redirect them to the authenticated app controller
    def check_session_status
      if current_user
        redirect_to dashboard_path
      end
    end
  
end