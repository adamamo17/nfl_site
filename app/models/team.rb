# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null
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
end
