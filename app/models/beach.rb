class Beach < ApplicationRecord
    has_many :breaks
    has_many :users, through: :breaks
    validates_presence_of :name, :street, :city, :parking

    accepts_nested_attributes_for :breaks
end
