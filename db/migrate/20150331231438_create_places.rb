class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :zip
      t.string :category
      t.string :long
      t.string :lat
      t.boolean :active, default: true
      t.string :slug

      t.timestamps
    end
  end
end
