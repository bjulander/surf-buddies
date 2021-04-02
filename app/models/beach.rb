class Beach < ApplicationRecord
    has_many :breaks
    has_many :users, through: :breaks
    validates_presence_of :name
    validates_uniqueness_of :name

    accepts_nested_attributes_for :breaks
end
