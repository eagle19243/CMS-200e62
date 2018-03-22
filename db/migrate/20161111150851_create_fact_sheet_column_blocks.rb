class CreateFactSheetColumnBlocks < ActiveRecord::Migration
  def change
    create_table :fact_sheet_column_blocks do |t|
      t.text :text
      t.integer :content_block_id

      t.timestamps
    end
  end
end
