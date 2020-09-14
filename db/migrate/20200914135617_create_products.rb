class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :desciption
      t.integer :price
      t.boolean :approved, default: false
      t.references :seller, foreign_key: true, index: true
      t.references :product_categories, foreign_key: true, index: true

      t.timestamps
    end
  end
end
