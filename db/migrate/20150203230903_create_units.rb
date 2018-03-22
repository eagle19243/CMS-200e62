class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :floor
      t.string :letter
      t.integer :number_of_bedrooms
      t.integer :number_of_bathrooms
      t.decimal :price, precision: 20, scale: 2
      t.integer :indoor_square_feet
      t.integer :outdoor_square_feet
      t.string :floorplan

      t.timestamps
    end
  end
end
