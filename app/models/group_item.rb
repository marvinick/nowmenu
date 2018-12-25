class GroupItem < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :group, optional: true
end
