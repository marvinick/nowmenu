class AddProjectIdToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :project_id, :integer
  end
end
