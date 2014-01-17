require "test_helper"

feature "Check for columns" do
  scenario "check if columns are loaded" do
    visit root_path
    page.body.must_include "columns"
  end
end
  

