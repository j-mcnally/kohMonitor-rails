class Admin::UsersController < Admin::AdminController
  
  # if the password field is empty, allow the password to stay the same
  before_filter :delete_empty_password_params, :only => :update
    
  # Get all users
  def index
    @users = User.search_sort_paginate(params).per(20)
  end
   
  # a list of users who are also administrators
  def admins
    @users = User.admin.search_sort_paginate(params)
    render :index
  end
  
  
  private 
    #if the password field is empty, allow the password to stay the same
    # called from a before filter
    def delete_empty_password_params
      params[:user].delete :password if params[:user][:password].blank?
      params[:user].delete :password_confirmation if params[:user][:password_confirmation].blank?
    end
    
    
  
end
