class Item < ApplicationRecord
    belongs_to :project
    has_many :reviews, dependent: :destroy

    validates_presence_of :title, length: {minimum: 5, maximum: 20}, allow_blank: false
    validates :content, length: {minimum: 5}
end
