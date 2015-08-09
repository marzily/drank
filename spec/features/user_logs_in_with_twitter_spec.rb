require "rails_helper"

RSpec.feature "user site access", type: :feature do
  include Capybara::DSL
  let(:weather_data) do
    { city: nil, state: nil, weather: nil }
  end

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

    allow_any_instance_of(UsersController).to receive(:weather_data).and_return(weather_data)
  end

  scenario "logging in with twitter omniauth" do
    visit "/"
    expect(page.status_code).to eq 200
    expect(current_path).to eq root_path

    click_link "Login"
    expect(current_path).to eq "/users/show"
    expect(page).to have_content("Margie")
    expect(page).to have_content("Logout")
  end

  scenario "logging out" do
    visit "/"
    click_link "Login"
    expect(current_path).to eq "/users/show"

    click_link "Logout"
    expect(current_path).to eq root_path
    expect(page).to_not have_content("Margie")
  end
end
