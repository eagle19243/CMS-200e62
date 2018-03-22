class AddFieldsToPressClippings < ActiveRecord::Migration
  def change
    add_column :press_clippings, :position, :integer
    add_column :press_clippings, :active, :boolean, default: true
  end
end
