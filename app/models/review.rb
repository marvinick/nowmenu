class Review < ApplicationRecord
    belongs_to :project
    belongs_to :item
    serialize :properties, Hash

    validates_presence_of :public_review, length: {minimum: 5, maximum: 280}, allow_blank: false
    validates_presence_of :properties 
end
