class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.integer :product_id
      t.string :desc
      t.timestamp :created_at

      t.timestamps
    end
  end
end
