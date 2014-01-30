require "test_helper"

feature "Creating a comment" do
  scenario "as a site visitor i want to create a comment on a post" do
    visit new_comment_path
    
    fill_in "Comment", with: comment(:cmt).context
    fill_in "Name", with: comment(:cmt).author
    fill_in "URL", with: comment(:cmt).author_url
    fill_in "Referred by:", with: comment(:cmt).referrer
    # When I submit the form
    click_on "Create Comment"
  end

  scenario "editors can approve comments" do
    sign_in(:editor)
    visit new_comment_path

    page.must_have_field('Approved')
  end
end
