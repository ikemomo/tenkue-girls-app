class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    users_path
  end

  def after_account_update_path_for(resource)
    user_path(resource)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :birthday, :engineer_start_at, :marriage, :childcare, :care, :employment_status])
  end
end

