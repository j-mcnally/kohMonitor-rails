class Admin::AdminController < ActionController::Base
  
  protect_from_forgery
    
  layout 'admin'

  before_filter :authenticate_user!
  before_filter :require_admin!
  # Handles redirecting to original path

  

  def index
  end
  

  
  
  private
    # used from a before filter, this method will block and redirect the user if they dont have admin access
    def require_admin!
      unless current_user.admin
        redirect_to root_path, :notice => 'You must be an admin to access this area'
      end
    end
    
end
  
  
 

  

