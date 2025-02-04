class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_person_name

  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :project_users
  has_many :projects, through: :project_users

  attribute :email, :string

end
