class Review < ApplicationRecord 
    belongs_to :project
    serialize :properties, Hash 
end 