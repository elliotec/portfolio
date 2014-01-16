require "test_helper"

feature "editing a post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
   
    visit posts_path
    # When I click and edit submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Post was succesfully updated"
    page.text.must_include "Web Developer"
  end
end
