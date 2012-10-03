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

require 'spec_helper'

describe Team do
  pending "add some examples to (or delete) #{__FILE__}"
end
