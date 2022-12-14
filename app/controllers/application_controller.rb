class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_up_path_for(resource)
    edit_public_user_path(resource)
  end  
  def after_sign_in_path_for(resource)
    public_user_path(resource)
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email, :password])
  end

end