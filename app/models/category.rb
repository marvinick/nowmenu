class Category < ApplicationRecord

  belongs_to :project

  validates_presence_of :name, length: {minimum: 5, maximum: 20}, allow_blank: false
  validates_presence_of :description, length: {minimum: 10, maximum: 100}, allow_blank: false
end
