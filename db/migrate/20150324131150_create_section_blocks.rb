class CreateSectionBlocks < ActiveRecord::Migration
  def change
    create_table :section_blocks do |t|
      t.string  :title
      t.text    :body
      t.string  :slug
      t.integer :content_block_id
      t.boolean :hidden, default: false

      t.timestamps
    end
    add_index :section_blocks, [:content_block_id]
  end
end