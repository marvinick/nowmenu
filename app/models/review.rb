class Review < ApplicationRecord 
    belongs_to :project
    belongs_to :item
    serialize :properties, Hash 
end 