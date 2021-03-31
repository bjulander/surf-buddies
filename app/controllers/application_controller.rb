class ApplicationController < ActionController::Base
  before_action :verified_user, :redirect_if_not_owner

  helper_method :current_user

  def verified_user
    redirect_to '/' unless authenticated_user
  end

  def authenticated_user
    !!current_user
  end

  def current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def redirect_if_not_owner(object)
    current_user.id != params[:object][:user_id]
  end

end
