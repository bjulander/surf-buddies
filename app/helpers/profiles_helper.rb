module ProfilesHelper

    def form_profile_helper(profile)
        profile ? user_profile_path(profile) : user_profiles_path
    end

end 