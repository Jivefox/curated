class CreateProductsCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :products_categories do |t|

      t.references :product, foreign_key: true, index: true
      t.references :category, foreign_key: true, index: true
    end
  end
end
