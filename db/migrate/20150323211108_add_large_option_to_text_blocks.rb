class AddLargeOptionToTextBlocks < ActiveRecord::Migration
  def change
    add_column :text_blocks, :large, :boolean, default: false
  end
end
