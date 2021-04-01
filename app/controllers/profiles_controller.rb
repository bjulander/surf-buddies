class ProfilesController < ApplicationController   

    before_action(:profile_user, :set_profile, except: [:index, :new, :create])

    def new
        @profile = Profile.new
    end

    def create
      @profile = Profile.new(profile_params)
      @profile.user_id = current_user.id
        if @profile.save
          redirect_to profile_path(@profile)
        else
          render :new
        end
    end

    def update
      if @profile.update(profile_params)
          redirect_to profile_path(@profile)
      else
          render :edit
      end
  end


    def destroy
      @user.delete
      redirect_to root_path
    end

    private

    def profile_params
      params.require(:profile).permit(:private, :phone_number, :location, :skill_level, :user_id)
    end

    def profile_user
      @user = current_user
    end

    def set_profile
        @profile = Profile.find_by(id: params[:id])
    end

end
    