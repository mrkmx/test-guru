class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(_user)
    current_user.admin? ? admin_tests_path : stored_location_for(:user) || root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[first_name last_name]
    devise_parameter_sanitizer.permit :account_update, keys: %i[first_name last_name]
  end
end
