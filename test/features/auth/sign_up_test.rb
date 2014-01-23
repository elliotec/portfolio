require "test_helper"

feature "try to sign up as a user" do
  scenario "click the sign up link" do
    visit new_user_registration_path
    save_and_open_page
    # click_on "Sign up"
  end
end
