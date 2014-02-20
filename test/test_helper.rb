ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails/capybara"
require "turn"
require "simplecov"
SimpleCov.start 'rails'

class ActiveSupport::TestCase
  fixtures :all
  #I18n.locale = :en

  Rails.application.routes.default_url_options = { :locale => :en }

  def sign_in(role = :editor)
    visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Password", with: "password1"
    page.find("[type='submit']").click 
  end
end
