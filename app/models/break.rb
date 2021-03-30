class Break < ApplicationRecord
    belongs_to :user
    belongs_to :beach

    scope(:breaks_search, ->(direction, shakas) {self.where("direction == ?", direction)})
end
