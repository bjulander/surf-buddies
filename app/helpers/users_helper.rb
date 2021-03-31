module UsersHelper

    def form_user_helper(user)
        user ? user : signup_path(user)
    end

end