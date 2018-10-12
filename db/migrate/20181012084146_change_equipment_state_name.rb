class ChangeEquipmentStateName < ActiveRecord::Migration[5.2]
  def change
    rename_column :equipment, :state, :status
  end
end
