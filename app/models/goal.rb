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

class Goal < ActiveRecord::Base

  STATUSES  = %w(Completed Ongoing Pending)
  SCOPES = %w(Private Public)
  validates :title, :scope, :status, :user, presence: true
  validates :scope, inclusion: {in: SCOPES}
  validates :status, inclusion: {in: STATUSES}
  has_many :comments
  belongs_to :user

  def self.statuses
    STATUSES
  end

  def self.scopes
    SCOPES
  end
end
