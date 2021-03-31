class Break < ApplicationRecord
    belongs_to :user
    belongs_to :beach

    validates_presence_of :name, :location, :break_type, :direction, :height, :water_level, :suggested_skill_level, :shakas
    validates_uniqueness_of :name

    #scope(:breaks_search, ->(direction, shakas) {self.where(["direction = ?", direction], ["shakas = ?", shakas])}
    scope(:breaks_search, ->(direction) {self.where("direction = ?", direction)})
end
