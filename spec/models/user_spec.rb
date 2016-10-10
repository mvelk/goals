# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryGirl.create(:user)
  end

  it { should validate_presence_of(:username) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:password_digest) }

  it { should have_many(:goals) }
  it { should have_many(:comments) }

  describe "::find_by_credentials" do
    it "should return user if valid params" do
      expect(User.find_by_credentials(user.username, user.password)).to eq(user)
    end

    it "should return nil if invalid params" do
      expect(User.find_by_credentials("", user.password)).to be_nil
    end
  end

  describe "#reset_session_token!" do
    it "sets session token to new value" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end
  end

end
