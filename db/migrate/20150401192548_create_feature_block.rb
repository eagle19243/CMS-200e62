class CreateFeatureBlock < ActiveRecord::Migration
  def change
    create_table :feature_blocks do |t|
      t.text :caption
      t.integer :content_block_id

      t.timestamps
    end

    add_index :feature_blocks, [:content_block_id]
  end
end
