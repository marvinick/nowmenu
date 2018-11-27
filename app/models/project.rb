class Project < ApplicationRecord
    has_many :items 
    has_many :categories
    accepts_nested_attributes_for :categories, allow_destroy: true 
end
