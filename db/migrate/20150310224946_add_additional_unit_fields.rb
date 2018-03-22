class AddAdditionalUnitFields < ActiveRecord::Migration
  def change
    add_column :units, :interior_square_meters, :integer
    add_column :units, :exterior_square_meters, :integer
    add_column :units, :status, :string
    add_column :units, :active, :boolean, default: true
    add_column :units, :monthly_taxes, :integer, default: 0
    add_column :units, :monthly_common_charges, :integer, default: 0
  end
end
