class AddQuantityToLines < ActiveRecord::Migration[5.0]
  def change
    add_column :lines, :quantity, :integer, default: 1
  end
end
