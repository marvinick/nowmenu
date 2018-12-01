class AddEmailToProjectUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :project_users, :email, :string
  end
end
