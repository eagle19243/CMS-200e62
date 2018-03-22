class AddDimensionsToVideoBlock < ActiveRecord::Migration
  def change
    add_column :video_blocks, :width, :integer
    add_column :video_blocks, :height, :integer
  end
end
