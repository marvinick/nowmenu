class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :full_name
      t.text :message
      t.timestamps
    end
  end
end
