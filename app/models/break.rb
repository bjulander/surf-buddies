class Break < ApplicationRecord
    belongs_to :user
    belongs_to :beach

    validates_presence_of :name, :location, :break_type, :direction, :height, :water_level, :suggested_skill_level, :shakas, :beach_name

    #scope(:breaks_search, ->(direction, shakas) {self.where(["direction = ?", direction], ["shakas = ?", shakas])}
    scope(:breaks_search, ->(direction) {self.where("direction = ?", direction)})

    def beach_name=(name)
        self.beach = Beach.find_or_create_by(name: name)
    end

    def beach_name
        self.beach ? self.beach.name : nil 
    end


end
