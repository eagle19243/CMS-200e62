class CreateUnitLines < ActiveRecord::Migration
  def change
    create_table :unit_lines do |t|
      t.string :name
      t.integer :number_of_bedrooms
      t.integer :number_of_bathrooms
      t.decimal :price, precision: 20, scale: 2
      t.integer :interior_square_feet
      t.integer :exterior_square_feet
      t.string :floorplan
      t.integer :interior_square_meters
      t.integer :exterior_square_meters
      t.string :status
      t.integer :active, default: true
      t.integer :monthly_taxes, default: 0
      t.integer :monthly_common_charges, default: 0
    end
  end
end
