# == Schema Information
#
# Table name: channels
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  kind        :string           not null

class Channel < ActiveRecord::Base
  validates :name, :description, presence: true

  has_many :messages
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
