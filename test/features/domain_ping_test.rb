require "test_helper"

feature "can ping domain" do
  scenario "find localhost" do
    visit("http://elliotec.herokuapp.com") 
    assert page.has_content?("Michael")
  end
end
