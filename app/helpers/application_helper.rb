module ApplicationHelper

    def all_beaches
        Beach.all
    end

    def current_user
        User.find_by(id: session[:user_id])
    end
end
