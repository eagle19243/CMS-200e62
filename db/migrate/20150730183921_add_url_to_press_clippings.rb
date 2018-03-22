class AddUrlToPressClippings < ActiveRecord::Migration
  def change
    add_column :press_clippings, :url, :string
  end
end
