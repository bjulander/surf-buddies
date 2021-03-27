class UsersController < ApplicationController
    has_many :breaks
    has_many :beaches, through: breaks

end