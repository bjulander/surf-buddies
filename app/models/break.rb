class Break < ApplicationRecord
    belongs_to :user
    belongs_to :beach

    validates_presence_of :name, :location, :break_type, :direction, :height, :water_level, :suggested_skill_level, :shakas
    before_validation :title_case

    #scope(:breaks_search, ->(direction, shakas) {self.where(["direction = ?", direction], ["shakas = ?", shakas])}
    scope(:direction_search, ->(direction) {self.where("direction = ?", direction)})
    scope(:name_search, ->(name) {self.where("name = ?", name)})

    def beach_name=(name)
        self.beach = Beach.find_or_create_by(name: name)
    end

    def beach_name
        self.beach ? self.beach.name : nil 
    end

    def title_case
        self.name = self.name.titlecase
    end


end
