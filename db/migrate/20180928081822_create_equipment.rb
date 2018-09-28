class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :vendor_code
      t.string :serial_number
      t.string :state
      t.integer :price_per_hour
      t.integer :price_per_day
      t.integer :price_per_month
      t.integer :rents_count
      t.integer :total_rents_price
      t.integer :user_id
      t.integer :group_id
      t.string :size

      t.timestamps
    end
  end
end
