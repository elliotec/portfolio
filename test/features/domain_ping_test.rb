require "test_helper"

feature "can ping domain" do
  scenario "find localhost" do
    visit("http://localhost:3000") 
    assert page.has_content?("Michael")
  end
end
