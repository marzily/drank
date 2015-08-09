require "rails_helper"

RSpec.feature "landing page", type: :feature do
  include Capybara::DSL
  before(:each) do
    Capybara.app = Drank::Application
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      info: { name:     "Margie",
              nickname: "marzily" },
      uid: "123",
      image_url: "something",
      credentials: { token: "pancake",
                     secret: "chocolate chip pancake" }
    })
  end

  scenario "logging in with twitter omniauth" do
    visit "/"
    expect(page.status_code).to eq 200
    click_link "Login"
    expect(current_path).to eq "/users/show"
    expect(page).to have_content("Margie")
    expect(page).to have_content("Logout")
  end
end
