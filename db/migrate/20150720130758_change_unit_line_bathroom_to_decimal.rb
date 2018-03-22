class ChangeUnitLineBathroomToDecimal < ActiveRecord::Migration
  def change
    change_column :unit_lines, :number_of_bathrooms, :decimal, precision: 20, scale: 1
  end
end
