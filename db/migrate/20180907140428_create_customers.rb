class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :discount
      t.datetime :birthdate
      t.string :address
      t.string :passport_id
      t.string :issued_by
      t.datetime :issue_date
      t.boolean :in_blacklist, default: false

      t.timestamps
    end
  end
end
