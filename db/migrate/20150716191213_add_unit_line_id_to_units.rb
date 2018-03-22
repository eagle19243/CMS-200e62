class AddUnitLineIdToUnits < ActiveRecord::Migration
  def change
    add_column :units, :unit_line_id, :integer
  end
end
