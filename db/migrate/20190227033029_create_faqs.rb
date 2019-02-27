class CreateFaqs < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs do |t|
      t.text :ask
      t.text :answer
      t.timestamps
    end
  end
end
