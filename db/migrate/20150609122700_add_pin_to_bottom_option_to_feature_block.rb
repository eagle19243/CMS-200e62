class AddPinToBottomOptionToFeatureBlock < ActiveRecord::Migration
  def change
    add_column :feature_blocks, :pin_to_bottom, :boolean, default: false
  end
end
