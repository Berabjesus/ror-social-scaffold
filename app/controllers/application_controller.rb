class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :find_friendship

  def find_friendship(user_id, friend_id)
    friendship = Friendship.find_by(user_id: user_id, friend_id: friend_id)
    friendship = Friendship.find_by(user_id: friend_id, friend_id: user_id) if friendship.nil?

    friendship.nil? ? nil : friendship.id
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
