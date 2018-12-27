class AddPositionToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :position, :integer
  end
end
