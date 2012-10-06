# == Schema Information
#
# Table name: teams
#
#  name       :string(255)
#  abbrev     :string(255)      primary key
#  url        :string(255)
#  division   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  attr_accessible :abbrev, :division, :name, :url

  self.primary_key = :abbrev

  has_one :coach

  validates :name, presence: true
  validates :abbrev, presence: true, length: { maximum: 3 }, uniqueness: { case_sensitive: false }
  validates :url, presence: true
  validates :division, presence: true

  def self.get_ids
    @ids = []
    @id_hash = self.connection.select_all("select abbrev from teams")
    @ids << ""
    @id_hash.count.times.each do |item|
      @team = Team.find(@id_hash[item]["abbrev"])
      if(@team.coach == nil)
        @ids << @id_hash[item]["abbrev"]
      end
    end
    @ids
  end
end
