require "test_helper"

feature "As the site visitor, I want to see some resources" do
  scenario "viewing all projects" do
    visit projects_path
    page.text.must_include "Barnyard Cereal"
    page.text.must_include "Ruby, Rails"
  end
end
