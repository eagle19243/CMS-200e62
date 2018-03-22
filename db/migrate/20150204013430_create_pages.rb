class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :slug
      t.integer :position
      t.boolean :active, default: true
      t.boolean :editable, default: true
      t.boolean :in_primary_nav, default: true
      t.timestamps
    end
  end
end