require "test_helper"

feature "can ping domain" do
  scenario "find domain name" do
    visit("http://elliotec.herokuapp.com") 
    assert page.has_content?("Michael")
  end
end
