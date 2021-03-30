class SessionsController < ApplicationController
    skip_before_action :verified_user

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    elsif @user
      @errors = ["Invalid Password"]
      render :new
    else
      @errors = ["Invalid Username"]
      render :new
    end
  end

  def create_with_fb
    user = User.find_or_create_by(username: outside_auth['info']['email']) do |u|
      u.password = 'password'
      u.password_confirmation = "password"
    end
    if user.save || user.id
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = ["Invalid Signin"]
      redirect_to signup_path
    end
  end

  def create_with_g
    user = User.find_or_create_by(username: outside_auth['info']['email']) do |u|
      u.password = 'password'
      u.password_confirmation = "password"
    end
    if user.save || user.id
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signup_path
    end
  end



  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def outside_auth
    self.request.env['omniauth.auth']
  end


end