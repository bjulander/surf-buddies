class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    

    def new
        @user = User.new
    end

    def create
      @user = User.new(user_params)
      binding.pry
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else @user
          render :new
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :phone_number, :location, :skill_level, :private)
    end
    
end