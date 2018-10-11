class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :rent_id
      t.integer :equipment_id

      t.timestamps
    end
  end
end
