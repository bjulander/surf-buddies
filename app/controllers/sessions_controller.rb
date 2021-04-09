class SessionsController < ApplicationController
    skip_before_action :verified_user
    require 'securerandom'

  def new
    @errors = []
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
    @user = User.find_by(username: outside_auth['info']['email'])
      if @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @user = User.create(username: outside_auth['info']['email']) do |u|
        u.password = SecureRandom.hex(13)
        flash[:message] = "Log in successful! Please create a password."
       end
      if @user.save
        session[:user_id] = @user.id
        redirect_to edit_user_path(@user)
      else
        redirect_to signup_path
      end
    end
  end

  def create_with_g
    @user = User.find_by(username: outside_auth['info']['email'])
      if @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        @user = User.create(username: outside_auth['info']['email']) do |u|
        u.password = SecureRandom.hex(13)
        flash[:message] = "Log in successful! Please create a password."
      end
      if @user.save
        session[:user_id] = @user.id
        redirect_to edit_user_path(@user)
      else
        redirect_to signup_path
      end
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