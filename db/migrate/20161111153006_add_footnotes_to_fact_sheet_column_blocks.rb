class AddFootnotesToFactSheetColumnBlocks < ActiveRecord::Migration
  def change
    add_column :fact_sheet_column_blocks, :footnotes, :text
  end
end
