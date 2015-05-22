class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :unit_price
      t.integer :quantity
      t.integer :manufacturer_id
      t.integer :category_id
      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :views
      t.string :available_size
      t.string :available_color
      t.integer :quantity_sold
      

      t.timestamps
    end
  end
end
