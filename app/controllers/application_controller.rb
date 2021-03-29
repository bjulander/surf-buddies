class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  before_action :verified_user
  helper_method :current_user

  helper_method(:current_user, :user_errors)

  private

  def verified_user
    redirect_to '/' unless authenticated_user
  end

  def authenticated_user
    !!current_user
  end

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def user_errors
    @user.errors.full_messages
  end
    
end
