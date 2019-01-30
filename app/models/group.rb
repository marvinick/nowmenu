class Group < ApplicationRecord
  include PublicActivity::Model
  tracked

  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

  belongs_to :project
  has_many :group_items
  has_many :items, through: :group_items
end
