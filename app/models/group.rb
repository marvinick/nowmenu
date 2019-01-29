class Group < ApplicationRecord
  include PublicActivity::Model
  tracked
  
  belongs_to :project
  has_many :group_items
  has_many :items, through: :group_items
end
