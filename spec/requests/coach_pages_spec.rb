require 'spec_helper'

describe "Coaches" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end

  describe "Coaches" do
    before { visit '/coaches/' }

    it { should have_selector('title',    text: 'NFL Coaches Home Page') }
    it { should have_selector('h1',    text: 'Click on Any Coach') }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a coach" do
        expect { click_button submit }.not_to change(Coach, :count)
      end
    end
  end

end