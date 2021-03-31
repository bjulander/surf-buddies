class ApplicationController < ActionController::Base
  before_action :verified_user

  helper_method(:current_user, :user_errors)

  def verified_user
    redirect_to '/' unless authenticated_user
  end

  def authenticated_user
    !!current_user
  end

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end
end
