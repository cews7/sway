class Tracker < ApplicationRecord
  validates :name, :purpose, presence: true 
end
