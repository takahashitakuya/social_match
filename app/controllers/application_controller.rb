class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_profie,:get_user_profile_id
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me,:format])
    
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :username, :email, :password, :remember_me,:format])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:display_name,:profile_image])

  end
  
  def is_profie
    
  end
  
  def get_user_profile_id
       if Profile.exists?(user_id: current_user.id)
        profile = Profile.find_by user_id: current_user.id
        profile.id
      end
  end
  

  
end
