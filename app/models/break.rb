class Break < ApplicationRecord
    belongs_to :user
    belongs_to :beach

    scope(:direction_search, ->(direction) {self.where("direction == ?", direction)})
end
