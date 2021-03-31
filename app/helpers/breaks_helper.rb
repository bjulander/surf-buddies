module BreaksHelper

    def form_url_helper(beach)
        beach ? beach_breaks_path(beach) : breaks_path
    end

end