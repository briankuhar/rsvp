Rails.application.routes.draw do
  devise_for :users
  resources :events do
    member do
      get 'rsvp'
    end
    resources :parties
    resources :guests do
      member do
        get 'rsvp', only: [:index]
        patch :update_status
      end
    end
  end
  
  
  get 'search', to: 'search#search'
  
  authenticated do
    root to: "events#index", as: :authenticated
  end
  
  root to: "home_page#static"
end
