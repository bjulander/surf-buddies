class ProfilesController < ApplicationController   
  before_action( :set_profile, except: [:index, :new, :create])

  def new
    if current_user.profile
      @profile = current_user.profile
      profile_show
    else
      @profile = Profile.new
    end
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      profile_show
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      profile_show
    else
      render :edit
    end
  end


  def destroy
    @profile.delete
    redirect_to user_path(current_user)
  end

  private

  def profile_params
    params.require(:profile).permit(:private_account, :phone_number, :location, :skill_level, :user_id)
  end

  # def profile_user
  #   @user = current_user
  # end

  def set_profile
    @profile = Profile.find_by(id: params[:id])
  end

  def profile_show
    redirect_to user_profile_path(current_user, @profile)
  end

end
    