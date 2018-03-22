class CreateFactSheets < ActiveRecord::Migration
  def change
    create_table :fact_sheets do |t|
      t.string :language
      t.text :introduction
      t.string :pdf
      t.integer :position
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
