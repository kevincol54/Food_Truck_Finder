class CreateFoodTrucks < ActiveRecord::Migration
  def change
    create_table :food_trucks do |t|
      t.string :name
      t.string :description
      t.string :eatable_type
      t.integer :eatable_id
      t.timestamps
    end
  end
end
