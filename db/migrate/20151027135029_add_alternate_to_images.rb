class AddAlternateToImages < ActiveRecord::Migration
  def change
    add_column :images, :alternate, :string
  end
end
