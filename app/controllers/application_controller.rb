class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
      # For additional fields in app/views/devise/registrations/new.html.erb
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birth_date, :address, :zip_code, :city, :about_me, :photo])

      # For additional in app/views/devise/registrations/edit.html.erb
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birth_date, :address, :zip_code, :city, :about_me, :photo])
    end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
end
