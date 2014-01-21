require "test_helper"

feature "As the site owner, I want to delete portfolio items so that I can keep the list focused on my best work" do
  scenario "deleting an existing project" do
    visit projects_path
    name = projects(:portfolio).name

    page.all('a')[1].click
    page.wont_have_content name
  end
end
