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

  before { @team = Team.new(name: "CMU Tartans", abbrev: "cmu", url: 'www.cmu.edu', division: 'UAA') }

  subject { @team }

  it { should respond_to(:name) }
  it { should respond_to(:abbrev) }
  it { should respond_to(:url) }
  it { should respond_to(:division) }

  it { should be_valid }

  describe "when name is not present" do
    before { @team.name = " " }
    it { should_not be_valid }
  end

  describe "when abbreviation is not present" do
    before { @team.abbrev = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @team.abbrev = "a" * 4 }
    it { should_not be_valid }
  end

  describe "when abbreviation is already taken" do
    before do
      team_with_same_abbrev = @team.dup
      team_with_same_abbrev.abbrev = @team.abbrev.upcase
      team_with_same_abbrev.save
    end

    it { should_not be_valid }
  end

end
