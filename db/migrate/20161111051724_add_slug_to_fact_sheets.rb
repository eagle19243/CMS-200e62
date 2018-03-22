class AddSlugToFactSheets < ActiveRecord::Migration
  def change
    add_column :fact_sheets, :slug, :string
  end
end
