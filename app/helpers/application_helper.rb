module ApplicationHelper

    def my_beaches
        current_user.beaches
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def all_beaches
        Beach.all
    end
end
