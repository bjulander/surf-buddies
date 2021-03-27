class BeachesController < ApplicationController
    has_many :breaks
    has_many :users, through: breaks

end