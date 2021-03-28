class User < ApplicationRecord
    has_many :breaks
    has_many :beaches, through: breaks
    has_secure_password
end
