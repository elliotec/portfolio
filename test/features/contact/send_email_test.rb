require "test_helper"

feature "as a user i wanna send an email" do
  scenario "fill out form and send" do
    visit contact_path

    fill_in "Name", with: "Bobbyboy"
    fill_in "Email", with: "bob@bob.com"
    fill_in "Subject", with: "I want your Bob"
    fill_in "Body", with: "Bobbidy boppity bobs."

    click_on "Send"

    page.text.must_include "Message was successfully"
  end
end
