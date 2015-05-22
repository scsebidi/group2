class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :username
      t.text :review
      t.integer :product_id
      t.timestamp :created_at

      t.timestamps
    end
  end
end
