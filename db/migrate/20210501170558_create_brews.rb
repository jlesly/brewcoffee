class CreateBrews < ActiveRecord::Migration[6.1]
  def change
    create_table :brews do |t|
      t.string :name
      t.string :brand
      t.integer :grind_size
      t.decimal :dose
      t.decimal :extraction_volume
      t.decimal :extraction_time
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
