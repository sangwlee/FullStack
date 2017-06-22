# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  channel_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ActiveRecord::Base
  validates :user_id, :channel_id, presence: true

  belongs_to :user
  belongs_to :channel


  # has_many :messages, through: :channel
end
