class CreateRentItems < ActiveRecord::Migration[5.2]
  def change
    create_table :rent_items do |t|
      t.integer :equipment_id
      t.integer :rent_id

      t.timestamps
    end
  end
end
