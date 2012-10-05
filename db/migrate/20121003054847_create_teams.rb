class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, :id => false do |t|
      t.string :name
      t.string :abbrev
      t.string :url
      t.string :division

      t.timestamps
    end
    add_index :teams, [:abbrev], :unique => true
    add_index :teams, :name
    add_index :teams, :abbrev
    add_index :teams, :url
    add_index :teams, :division
  end
end
