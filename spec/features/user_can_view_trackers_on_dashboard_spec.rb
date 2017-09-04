require 'rails_helper'

RSpec.describe "As a user" do
  context "When I am on the dashboard" do
    it "I see my trackers" do
      user = create(:user)
      tracker = create(:tracker)
      byebug
      user_tracker = create(:user_tracker, user_id: user.id, tracker_id: tracker.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      expect(page).to have_selector(:id, 'tracker')
    end
  end
end
