class User < ApplicationRecord
  has_secure_password
  validates :username, :email, presence: true
  validates :email, uniqueness: true

  has_many :user_trackers
  has_many :trackers, through: :user_trackers
end
