class AddIndexToTeamsAbbrev < ActiveRecord::Migration
  def change
    add_index :teams, :abbrev, unique: true
  end
end

