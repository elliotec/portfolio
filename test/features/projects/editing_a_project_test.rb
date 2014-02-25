require "test_helper"

feature "As a site owner, I want to be able to edit a project so that I can correct typos" do
  scenario "editing an existing project" do
    # Given an existing post
    visit edit_project_path(projects(:portfolio))
    # When I make changes
    fill_in "Name", with: "Sweet Portfolio!"
    click_on :submit
    # Then the changes should be saved and shown
    page.text.must_include "Sweet Portfolio!"
    page.text.wont_include "Legitimizable"
  end

  scenario "incorrectly editing an existing project" do
    visit edit_project_path(projects(:portfolio))
      fill_in "Name", with: "E"
      click_on :submit
      page.text.must_include "prohibited"
      page.text.must_include "too short"
  end
end
