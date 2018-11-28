class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :public_review
      t.text :private_review
      t.integer :project_id
      t.text :properties
      t.timestamps 
    end
  end
end
