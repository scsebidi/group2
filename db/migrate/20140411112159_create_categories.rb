class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.timestamp :created_at

      t.timestamps
    end
  end
end
