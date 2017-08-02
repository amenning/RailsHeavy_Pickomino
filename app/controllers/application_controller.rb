class ApplicationController < ActionController::Base
  include Pundit
  #after_action :verify_authorized
  #after_action :verify_policy_scoped
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def after_sign_in_path_for(resource)
    play_games_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:firstname, :lastname, :username, :email]
    )
  end

  def authenticate_user!(options = {})
    if user_signed_in?
      super(options)
    else
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to root_path
    end
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end
end
