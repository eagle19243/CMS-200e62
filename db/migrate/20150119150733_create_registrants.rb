class CreateRegistrants < ActiveRecord::Migration
  def change
    create_table :registrants do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :country
      t.boolean :is_a_broker, default: false

      t.timestamps
    end
  end
end
