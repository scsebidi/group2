class AddProductnameToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :productname, :string
  end
end
