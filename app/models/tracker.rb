class Tracker < ApplicationRecord
  validates :name, :purpose, :partner, presence: true 
end
