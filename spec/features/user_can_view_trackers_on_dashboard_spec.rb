require 'rails_helper'

RSpec.describe "As a user" do
  context "When I am on the dashboard" do
    it "I see my trackers" do
      user = create(:user)
      tracker = create(:tracker)
      partner = create(:user,
                       email: "partner@email.com")
      user.trackers << tracker
      partner.trackers << tracker
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      save_and_open_page
      
      expect(page).to have_content(tracker.name)
    end
  end
end
