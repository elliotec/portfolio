require "test_helper"

feature "As the site owner, I want to delete portfolio items so that I can keep the list focused on my best work" do
  scenario "deleting an existing project" do
    name = projects(:portfolio).name
    visit projects_path

    page.find("a[href='#{project_path(projects(:portfolio))}'][data-method='delete']").click
    
    page.wont_have_content name
  end
end
