require "test_helper"

feature "Check for theme" do
  scenario "check if social icons load in theme" do
    visit root_path
    page.body.must_include "fa-facebook"
  end
end
