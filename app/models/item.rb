class Item < ApplicationRecord 
    belongs_to :project
    has_many :reviews
end 