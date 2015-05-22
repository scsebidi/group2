class CreateShippers < ActiveRecord::Migration
  def change
    create_table :shippers do |t|
      t.string :shipper_name
      t.integer :contact_number

      t.timestamps
    end
  end
end
