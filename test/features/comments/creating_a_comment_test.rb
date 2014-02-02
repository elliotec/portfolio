require "test_helper"

feature "Creating a comment" do
  scenario "as a site visitor i want to create a comment on a post" do
    sign_in(:editor)
    visit post_path(posts(:cr))
    
    fill_in "Comment", with: comment(:cmt).context
    # When I submit the form
    click_on "Create Comment"
    #page.must_have_content('Successfully')
  end

  scenario "editors can approve comments" do
    sign_in(:editor)
    visit post_path(posts(:http))
    
    click_on 'Approve'

  end
end
