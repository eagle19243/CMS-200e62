  class CreatePressClippings < ActiveRecord::Migration
  def change
    create_table :press_clippings do |t|
      t.text :blurb
      t.string :source
      t.string :url
      t.references :image

      t.timestamps
    end
  end
end
