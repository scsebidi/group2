class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :product_type
      t.timestamp :created_at

      t.timestamps
    end
  end
end
