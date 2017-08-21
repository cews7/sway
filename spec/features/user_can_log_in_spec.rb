require 'rails_helper'

RSpec.describe "as a user" do
  context "when I successfully login" do
    it "with valid credentials" do
      visit "/login"

      user = User.create(username: "jon", email: "jon@email.com", password: "123jon")

      within ".card-content" do
        fill_in "session[email]", with: "jon@email.com"
        fill_in "session[password]", with: "123jon"
        click_on "Login!"
      end

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_content("Welcome!")
    end
  end
  context "unsuccessful login with wrong email" do
    it "I am redirected to login" do
      visit "/login"

      user = User.create(username: "jon", email: "jon@email.com", password: "123jon")

      within ".card-content" do
        fill_in "session[email]", with: "jo@email.com"
        fill_in "session[password]", with: "123jon"
        click_on "Login!"
      end

      expect(current_path).to eq(login_path)
    end
  end
  context "unsuccessful login with wrong password" do
    it "I am redirected to login" do
      visit "/login"

      user = User.create(username: "jon", email: "jon@email.com", password: "123jon")

      within ".card-content" do
        fill_in "session[email]", with: "jon@email.com"
        fill_in "session[password]", with: "13jon"
        click_on "Login!"
      end

      expect(current_path).to eq(login_path)
    end
  end
end
