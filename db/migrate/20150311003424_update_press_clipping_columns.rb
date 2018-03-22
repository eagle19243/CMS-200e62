class UpdatePressClippingColumns < ActiveRecord::Migration
  def up
    remove_column :press_clippings, :url
    add_column :press_clippings, :publication_date, :date
  end
end
