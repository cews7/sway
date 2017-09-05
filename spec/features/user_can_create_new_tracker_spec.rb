require 'rails_helper'

RSpec.describe "As a user" do
  context "I am on the dashboard page" do
    it "when I go to the trackers#new I see a form" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      within ".nav-wrapper" do
        click_on "+"
      end

      expect(current_path).to eq(new_tracker_path)
      expect(page).to have_content('Name')
      expect(page).to have_content('Purpose')
      expect(page).to have_button('Create Tracker!')
      expect(page).to have_content('LOGOUT')
    end
  end

  context "I am on tracker#new" do
    it "when I click submit I'm sent to show" do
      user = create(:user)
      partner = create(:user,
                       email: "other@email.com")
      tracker = create(:tracker)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_tracker_path

      within ".card-content" do
        fill_in "tracker[name]", with: "bills"
        fill_in "tracker[purpose]", with: "hold each other accountable for paying bills"
        fill_in "tracker[partner_email]", with: partner.email
        click_on "Create Tracker!"
      end

      expect(current_path).to eq(tracker_path(tracker.id + 1))
    end

    it "fails when there is no valid partner" do
      user = create(:user)
      tracker = create(:tracker)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_tracker_path

      within ".card-content" do
        fill_in "tracker[name]", with: "bills"
        fill_in "tracker[purpose]", with: "hold each other accountable for paying bills"
        fill_in "tracker[partner_email]", with: "partner@email.com"
        click_on "Create Tracker!"
      end

      expect(page).to have_content("partner@email.com does not exist, please input valid email")
    end
  end
end
