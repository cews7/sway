require 'rails_helper'

RSpec.describe "as a guest" do
  context "When I am on the /root" do
    it "I can make an account" do
      visit login_path
      expect(page).to have_content("Sign Up!")

      click_on("Sign Up!")

      expect(current_path).to eq(new_user_path)

      fill_in :username, with: "jon"
      fill_in :email, with: "jon@email.com"
      fill_in :password, with: "jon123"
      fill_in :password_confirmation, with: "jon123"
      click_on("Create Account!")

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome!")
    end
  end
end
