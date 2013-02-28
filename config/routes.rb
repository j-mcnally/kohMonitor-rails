Kohdr::Application.routes.draw do
    



  devise_for :user do
    get "logout" => "devise/sessions#destroy"
  end

  match "dashboard", :to => "authenticated#index"
  
  

  
  
  namespace :api do
    resources :headlines
    resources :pages
  end



  # the Admin                                                                   (http://www.domain.com/admin)
  # ---------------------------------------------------------------------------------------------------------
  
  namespace :admin do
  
    root :to => "users#index"
    
    resources :users do
      collection do
        get :admins
        get :deleted
      end
      member do
        get :delete
        get :undelete
      end
    end
      resources :headlines
      resources :pages
    
    
  end
  
end
