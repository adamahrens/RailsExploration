class AddDefaultToOrdersForPaid < ActiveRecord::Migration[5.0]
  def change
    change_column_default :orders, :paid, false
  end
end
