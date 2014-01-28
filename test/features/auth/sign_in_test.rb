require "test_helper"

feature "sign in as an existing user" do
  scenario "click the sign in link" do
    visit edit_user_registration_path
    fill_in "Email", with: users(:us).email
    fill_in "Password", with: "password1"
    click_on "Sign in"
    #page.find("[type='submit']").click
    page.text.must_include "successfully"
  end
end