class AddFieldsToRegistrants < ActiveRecord::Migration
  def change
    add_column :registrants, :referrer, :string
    add_column :registrants, :residence_size, :string
    add_column :registrants, :comments, :text
  end
end
