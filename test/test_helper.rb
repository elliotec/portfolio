ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails/capybara"
require "turn"
require "minitest/pride"

class ActiveSupport::TestCase
  fixtures :all
  # Add more helper methods to be used by all tests here...
  def sign_in
    visit new_user_session_path
    fill_in "Email", with: users(:us).email
    fill_in "Password", with: "password1"
    click_on "Sign in"  
  end
end
