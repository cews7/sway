RSpec.describe "As a user" do
  context "When I am logged in" do
    it "I can sign out" do
      user = User.create(username: "sam", email: "sam@email.com", password: "123sam")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      expect(page).to have_content("Logout")
      click_on("Logout")

      expect(current_path).to eq(login_path)
    end
  end
end
