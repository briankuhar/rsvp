Rails.application.routes.draw do
  devise_for :users
  resources :events do
    member do
      get 'rsvp'
    end
    resources :guests do
      member do
        get 'rsvp', only: [:index]
        patch :update_status
        
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  authenticated do
    root to: "events#index", as: :authenticated
  end
  
  root to: "home_page#static"
end
