# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  scope      :string
#  status     :string
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :goal do
    
  end
end
