class AuthenticatedController < ActionController::Base
  
  # This is the authenticated controller. All application controllers that
  # require authentication should extend this controller
  
  protect_from_forgery
  
  before_filter :authenticate_user!  
  before_filter :capture_path
  
  # We'll use the application layout for now...feel free to modify if needed
  layout 'application'
  
  # Index logic here  
  def index
  end
  
  
  
  
  # Session redirects and helpers
  # ------------------------------------------------------------------------------------------------------
  
  # Capture the URL
  def capture_path
    session[:return_to] = request.path if request.method == "GET" && !devise_controller? && !request.xhr? && action_name != 'redirect'
    @referrer_url = request.env['HTTP_REFERER']
  end
  
  # After sign in, redirect them to the url they were originally going to
  def after_sign_in_path_for(resource)
    session[:user_return_to] || root_path
  end
  
  # After sign up, redirect them to the url they were originally going to
  def after_sign_up_path_for(resource)
    session[:user_return_to] || root_path
  end
  
  
  
end