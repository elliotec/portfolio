require "test_helper"

feature "sign in as an existing user" do
  scenario "click the sign in link" do
    visit edit_user_registration_path
    fill_in "Email", with: users(:us).email
    fill_in "Password", with: "password1"
    click_on "Sign in"
    #page.find("[type='submit']").click
    page.text.must_include "successfully"
  end
   scenario "sign in with twitter works" do
   visit root_path
   click_on "Sign In"
   OmniAuth.config.test_mode = true
   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
   OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
   click_on "Sign in with Twitter"
   save_and_open_page
   page.must_have_content "test_twitter_user, you are signed in!"
  end
end
