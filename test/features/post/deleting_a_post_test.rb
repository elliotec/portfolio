require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    sign_in
    # Given an existing post
    visit posts_path
    title = posts(:cr).title

    # When the delete link is clicked
    page.find("tbody tr:last").click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content title
  end
end
