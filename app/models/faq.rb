class Faq < ApplicationRecord
  belongs_to :project
  validates_presence_of :ask, :answer

end
