class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
