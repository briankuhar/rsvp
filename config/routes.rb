Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', 
                           registrations: 'users/registrations' }
  resources :events do
    member do
      get 'rsvp'
    end
    resources :parties
    resources :guests do
      member do
        patch :update_status
      end
    end
  end
  
  authenticated do
    root to: "events#index", as: :authenticated
  end
  
  root to: "home_page#static"
end
