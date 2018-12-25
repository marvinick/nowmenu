class AddProjectIdToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :project_id, :integer
  end
end
