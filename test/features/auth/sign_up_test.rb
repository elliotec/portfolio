require "test_helper"

feature "try to sign up as a user" do
  scenario "click the sign up link" do
    visit new_user_registration_path
    fill_in "Email", with: "judas@thebible.com"
    fill_in "Password", with: "joyfulsecretjesus"
    fill_in "Password confirmation", with: "joyfulsecretjesus"
    page.find("[type='submit']").click
    page.text.must_include "successfully"
  end
end
