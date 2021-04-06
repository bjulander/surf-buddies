module BeachesHelper

    def my_beaches
        @my_beaches = current_user.beaches.uniq
    end

    def all_beaches
        Beach.all
    end

end