class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information do |t|
      t.string :title
      t.text :content
      t.integer :category_id, index: true

      t.timestamps
    end
  end
end
