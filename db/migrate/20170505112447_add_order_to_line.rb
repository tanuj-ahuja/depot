class AddOrderToLine < ActiveRecord::Migration[5.0]
  def change
    add_reference :lines, :order, foreign_key: true
  end
end
