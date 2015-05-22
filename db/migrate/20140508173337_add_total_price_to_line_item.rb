class AddTotalPriceToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :total_price, :integer
  end
end
