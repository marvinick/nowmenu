class Group < ApplicationRecord
  # include PublicActivity::Model
  # tracked
  #
  # tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

  belongs_to :project

  validates_presence_of :name, length: {minimum: 3, maximum: 30}, allow_blank: false
  validates_presence_of :description, length: {minimum: 5, maximum: 200}, allow_blank: false

  has_many :group_items
  has_many :items, through: :group_items
end
