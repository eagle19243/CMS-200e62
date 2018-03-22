class AddAlternateToFeatureBlocks < ActiveRecord::Migration
  def change
    add_column :feature_blocks, :alternate, :string
  end
end
