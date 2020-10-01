class ChangeDefaultValueForSoldProducts < ActiveRecord::Migration[6.0]
  def up
    change_column_default :products, :sold, from: true, to: false
  end

  def down
    change_column_default :products, :sold, from: false, to: true
  end
end
