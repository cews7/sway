class UserTracker < ApplicationRecord
  belongs_to :user
  belongs_to :tracker
end
