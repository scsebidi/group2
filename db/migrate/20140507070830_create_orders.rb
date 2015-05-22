class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :email
      t.string :name
      t.text :address
      t.string :pay_type
      t.timestamp :created_at
      t.timestamp :updated_at
      t.string :order_status, :default => 0

      t.timestamps
    end
  end
end
