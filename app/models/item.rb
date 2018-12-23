class Item < ApplicationRecord
    belongs_to :project
    has_many :reviews, dependent: :destroy
    before_create :generate_random_id

    validates_presence_of :title, length: {minimum: 5, maximum: 30}, allow_blank: false
    validates :content, length: {minimum: 5, maximum: 280}, allow_blank: false

    def generate_random_id
      begin
        self.id = SecureRandom.random_number(1_000_0000)
      end while Item.where(id: self.id).exists?
    end
end
