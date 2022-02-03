class CreateMovementCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :movement_categories do |t|
      t.string :name
      t.references :movement_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
