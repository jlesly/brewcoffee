class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :brand_model
    
      t.timestamps
    end
  end
end
