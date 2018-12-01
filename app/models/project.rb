class Project < ApplicationRecord
    has_many :project_users 
    has_many :users, through: :project_users
    has_many :items, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :categories, dependent: :destroy
    accepts_nested_attributes_for :categories, allow_destroy: true 
end
