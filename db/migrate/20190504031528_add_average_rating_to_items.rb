class AddAverageRatingToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :average_rating, :float
  end
end
