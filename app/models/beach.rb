class Beach < ApplicationRecord
    has_many :breaks
    has_many :users, through: :breaks
    validates_presence_of :name
    validates_uniqueness_of :name
    before_validation :title_case

    accepts_nested_attributes_for :breaks

    scope(:beaches_search, -> (name) {self.where("lower(name) = ?", name.downcase)})


    def title_case
        self.name = self.name.titlecase
    end
end

