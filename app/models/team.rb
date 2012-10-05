# == Schema Information
#
# Table name: teams
#
#  id         :integer
#  name       :string(255)
#  abbrev     :string(255)      primary key
#  url        :string(255)
#  division   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  attr_accessible :abbrev, :division, :name, :url, :id

  self.primary_key = :abbrev

  has_one :coach

  validates :name, presence: true
  validates :abbrev, presence: true, length: { maximum: 3 }, uniqueness: { case_sensitive: false }
  validates :url, presence: true
  validates :division, presence: true
end
