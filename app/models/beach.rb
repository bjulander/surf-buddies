class Beach < ApplicationRecord
    has_many :breaks
    has_many :users, through: breaks
end
