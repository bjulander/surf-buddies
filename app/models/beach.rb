class Beach < ApplicationRecord
    has_many :breaks
    has_many :users, through: :breaks

    accepts_nested_attributes_for :breaks
end
