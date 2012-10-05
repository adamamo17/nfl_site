class RemoveNullIdFromTeams < ActiveRecord::Migration
  def up
    change_column :teams, :id, :integer, :null => true
  end

  def down
  end
end
