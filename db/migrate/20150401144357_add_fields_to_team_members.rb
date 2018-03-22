class AddFieldsToTeamMembers < ActiveRecord::Migration
  def up
    remove_column :team_members, :biography
    add_column :team_members, :bio, :text
    add_column :team_members, :position, :integer
    add_column :team_members, :active, :boolean, default: true
  end

  def down
    add_column :team_members, :biography, :text
    remove_column :team_members, :bio, :text
    remove_column :team_members, :position
    remove_column :team_members, :active
  end
end
