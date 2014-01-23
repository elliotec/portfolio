require "test_helper"

feature "visiting the post index" do
  scenario "with existing posts" do
    # Given existing posts
    
    # When I visit /posts
    visit posts_path

    # Then the existing posts should be loaded
    page.text.must_include posts(:anything_i_want).title
  end
end
