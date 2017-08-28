require 'rails_helper'

RSpec.describe "As a user" do
  it "I am on the dashboard page" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    click_button('+')

    expect(current_path).to eq(new_trackers_path)
    expect(page).to have_content('Name')
    expect(page).to have_content('Partner')
    expect(page).to have_content('Create Tracker!')
    expect(page).to have_content('Logout')
  end
end
