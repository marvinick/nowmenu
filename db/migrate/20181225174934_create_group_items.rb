class CreateGroupItems < ActiveRecord::Migration[5.2]
  def change
    create_table :group_items do |t|
      t.integer :item_id
      t.integer :group_id
      t.timestamps
    end
  end
end
