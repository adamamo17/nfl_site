require 'spec_helper'

describe "Team" do

  subject { page }

  describe "Teams" do
    before { visit '/teams/' }

    it { should have_selector('title',    text: 'NFL Teams Home Page') }
    it { should have_selector('h1',    text: 'Click on Any Team') }
  end

  describe "CMU Tartans" do
    let(:team) { FactoryGirl.create(:team) }
    before { visit team_path(team) }

    it { should have_selector('title',    text: 'CMU Tartans') }
    it { should have_selector('h1',    text: 'CMU Tartans') }
    it { should_not have_selector('h2',    text: 'This team is coached by') }
  end
end