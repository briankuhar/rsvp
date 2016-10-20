class Users::SessionsController < Devise::SessionsController
  layout :render_layout
  
  # before_action :configure_sign_in_params, only: [:create]

  
  private
    
    def render_layout
      case action_name
      when "new"
        "static"
      else
        "application"
      end
    end 
end
