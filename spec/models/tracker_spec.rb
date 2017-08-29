require 'rails_helper'

RSpec.describe Tracker, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:purpose) }
  it { should validate_presence_of(:partner) }
end
