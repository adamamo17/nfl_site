class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :abbrev
      t.string :url
      t.string :division

      t.timestamps
    end
  end
end
