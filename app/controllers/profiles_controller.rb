class ProfilesController < ApplicationController   

  before_action(:profile_user, :set_profile, except: [:index, :new, :create])

  def new
    if current_user.profile
      redirect_to user_profile_path(current_user, current_user.profile.user_id)
    else
      @profile = Profile.new
    end
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to user_profile_path(current_user, @profile.user_id)
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
        redirect_to user_profile_path(current_user, @profile.user_id)
    else
        render :edit
    end
  end


  def destroy
    @profile.delete
    redirect_to 
  end

  private

  def profile_params
    params.require(:profile).permit(:private_account, :phone_number, :location, :skill_level, :user_id)
  end

  def profile_user
    @user = current_user
  end

  def set_profile
      @profile = Profile.find_by(id: params[:id])
  end

end
    