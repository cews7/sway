require 'rails_helper'

RSpec.describe "As a guest" do
  context "When I am on the /root" do
    it "I can make an account" do
      visit login_path
      expect(page).to have_content("Sign Up!")

      click_on("Sign Up!")

      expect(current_path).to eq(new_user_path)

      within ".card-content" do
        fill_in "user[username]", with: "jon"
        fill_in "user[email]", with: "jon@email.com"
        fill_in "user[password]", with: "jon123"
        fill_in "user[password_confirmation]", with: "jon123"
        click_on("Create Account!")
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome!")
    end

    it "I fail to successfully make an account" do
      visit login_path
      expect(page).to have_content("Sign Up!")

      click_on("Sign Up!")

      expect(current_path).to eq(new_user_path)

      within ".card-content" do
        fill_in "user[email]", with: "jon@email.com"
        fill_in "user[password]", with: "jon123"
        fill_in "user[password_confirmation]", with: "jon123"
        click_on("Create Account!")
      end

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Username can't be blank")
    end
  end
end
