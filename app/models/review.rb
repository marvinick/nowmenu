class Review < ApplicationRecord
  include PublicActivity::Model
  tracked

  belongs_to :project
  belongs_to :item
  belongs_to :user
  serialize :properties, Hash

  validates_presence_of :public_review, length: {minimum: 5, maximum: 500}, allow_blank: false
  validates_presence_of :properties
end
