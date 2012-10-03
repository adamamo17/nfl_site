class AddTeamIdToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :team_id, :string
  end
end
