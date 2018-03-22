class ChangeSquareFeetColumnNames < ActiveRecord::Migration
  def change
    rename_column :units, :indoor_square_feet, :interior_square_feet
    rename_column :units, :outdoor_square_feet, :exterior_square_feet
  end
end
