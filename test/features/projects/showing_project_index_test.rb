require "test_helper"

feature "As the site visitor, I want to see a developer's portfolio" do
  scenario "viewing a project" do
    visit projects_path
    page.text.must_include "Edit"
  end
end
