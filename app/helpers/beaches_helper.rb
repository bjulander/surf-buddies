module BeachesHelper

    def my_beaches
        @my_beaches = current_user.beaches.uniq
    end

    def all_beaches
        Beach.all
    end

    def beach_break
        @breaks = @beach.breaks.where(user_id: current_user.id)
    end

end