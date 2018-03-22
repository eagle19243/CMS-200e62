class AddSizeFiledsToImageBlocks < ActiveRecord::Migration
  def change
    add_column :image_blocks, :size, :string, default: 'small'
  end
end
