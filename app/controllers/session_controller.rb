class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    elsif @user
      @errors = ["Invalid Password"]
      render 'new'
    else
      @errors = ["Invalid Username"]
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end


end