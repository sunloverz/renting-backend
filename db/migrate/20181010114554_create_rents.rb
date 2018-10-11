class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.string :status
      t.string :rent_type
      t.datetime :start_date
      t.datetime :end_date
      t.integer :price
      t.integer :discount
      t.integer :customer_id
      t.integer :user_id
      t.integer :paid

      t.timestamps
    end
  end
end
