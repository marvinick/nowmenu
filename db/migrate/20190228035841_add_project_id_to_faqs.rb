class AddProjectIdToFaqs < ActiveRecord::Migration[5.2]
  def change
    add_column :faqs, :project_id, :integer
  end
end
