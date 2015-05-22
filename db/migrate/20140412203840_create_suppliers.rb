class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :company_name
      t.string :contact_email
      t.integer :contact_number
      t.string :address
      t.string :suburb
      t.string :city
      t.string :province
      t.timestamp :created_at

      t.timestamps
    end
  end
end
