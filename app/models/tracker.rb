class Tracker < ApplicationRecord
  validates :name, :purpose, presence: true

  has_many :user_trackers
  has_many :users, through: :user_trackers

  attr_accessor :partner_email
end
