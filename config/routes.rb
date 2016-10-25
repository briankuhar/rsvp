Rails.application.routes.draw do
  devise_for :users, :controllers => { sessions: "users/sessions", registrations: "users/registrations" }
  ActiveAdmin.routes(self)
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
  
  authenticated :user do
    root to: "events#index", as: :authenticated_root
  end
  
  root to: "home_page#static"
end
