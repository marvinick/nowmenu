class Category < ApplicationRecord
    belongs_to :project

    validates_presence_of :name, length: {minimum: 5, maximum: 20}, allow_blank: false
    validates :description, length: {minimum: 5, maximum: 100}, allow_blank: false
end
