class Project < ApplicationRecord
  before_create :generate_random_id
  has_many :groups, dependent: :destroy
  has_many :project_users
  has_many :users, through: :project_users
  has_many :items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :faqs

  include PublicActivity::Model
  tracked

  # tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

  accepts_nested_attributes_for :categories, allow_destroy: true

  validates_presence_of :name, length: {minimum: 5, maximum: 30}, allow_blank: false
  validates :description, length: {minimum: 5}, allow_blank: false

  def generate_random_id
    begin
      self.id = SecureRandom.random_number(1_000_0000)
    end while Project.where(id: self.id).exists?
  end
end
