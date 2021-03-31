class User < ApplicationRecord
    
    has_many :breaks
    has_many :beaches, through: :breaks

    has_secure_password
    validates_presence_of :username, :password_confirmation
    validates_uniqueness_of :username


    #accepts_nested_attributes_for :breaks

end
