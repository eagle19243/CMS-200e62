class AddAlternateToImageBlocks < ActiveRecord::Migration
  def change
    add_column :image_blocks, :alternate, :string
  end
end
