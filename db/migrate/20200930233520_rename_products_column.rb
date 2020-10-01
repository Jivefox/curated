class RenameProductsColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :available, :sold
  end
end
