require "test_helper"

feature "try to sign up as a user" do
  scenario "click the sign up link" do
    visit new_user_registration_path
    fill_in "Email", with: "judas@thebible.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    page.find("[type='submit']").click
    click_on "Sign out"
    visit edit_user_registration_path
    page.text.must_include "before continuing"
  end
end
