require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

   # SETUP
   before :each do
    @user = User.create!(
      name:                  "Test",
      last_name:             "User",
      email:                 "test@test.com",
      password:              "password",
      password_confirmation: "password"
    )
  end

  scenario "User can navigate to the login page and login" do

    visit login_path
    within "nav" do
      expect(page).to have_content("Login")
    end
    fill_in "email",    with: @user.email
    fill_in "password", with: @user.password
    click_button "Submit"
    within "nav" do
      expect(page).to have_content("Logout")
    end

    save_screenshot
  end

end