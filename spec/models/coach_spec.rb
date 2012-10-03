# == Schema Information
#
# Table name: coaches
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  team_id         :string(255)
#

require 'spec_helper'

describe Coach do

  before { @coach = Coach.new(name: "Example Coach", email: "coach@example.com",
                              password: "railsrules", password_confirmation: "railsrules") }

  subject { @coach }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
    before { @coach.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @coach.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[coach@foo,com coach_at_foo.org example.coach@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @coach.email = invalid_address
        @coach.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[coach@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @coach.email = valid_address
        @coach.should be_valid
      end
    end
  end

  describe "when password is not present" do
    before { @coach.password = @coach.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @coach.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @coach.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @coach.password = @coach.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @coach.save }
    let(:found_coach) { Coach.find_by_email(@coach.email) }

    describe "with valid password" do
      it { should == found_coach.authenticate(@coach.password) }
    end

    describe "with invalid password" do
      let(:coach_for_invalid_password) { found_coach.authenticate("invalid") }

      it { should_not == coach_for_invalid_password }
      specify { coach_for_invalid_password.should be_false }
    end
  end
end
