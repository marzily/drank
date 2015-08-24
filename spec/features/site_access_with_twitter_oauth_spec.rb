require "rails_helper"

RSpec.feature "user site access", type: :feature do
  include Capybara::DSL
  let(:session) do
    { temp_f: '88',
      location: { "city" => "Denver",
                  "state" => "CO",
                  "latitude" => "39.7392",
                  "longitude" => "-104.9903" } }
  end

  let(:drink) { Drink.create(drink_type: "iced tea") }

  before(:each) do
    Weather.create(min_temp: nil, max_temp: 69)
    Weather.create(min_temp: 70, max_temp: 89)
    Weather.create(min_temp: 90, max_temp: nil)

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

    allow_any_instance_of(ApplicationController).to receive(:session).and_return(session)
    allow_any_instance_of(UsersHelper).to receive(:drinks_by_temp).and_return([drink])
    # allow_any_instance_of(UsersController).to receive(:restaurants).and_return(["Chipotle"])
  end

  scenario "logging in with twitter omniauth" do
    visit "/"
    expect(page.status_code).to eq 200
    expect(current_path).to eq root_path

    click_link "Login"
    expect(current_path).to eq "/users"
    expect(page).to have_content("Margie")
    expect(page).to have_link("Logout")
  end

  scenario "logging out" do
    visit "/"
    click_link "Login"
    expect(current_path).to eq "/users"

    click_link "Logout"
    expect(current_path).to eq root_path
    expect(page).to_not have_content("Margie")
  end

  scenario "returning user" do
    visit "/"
    click_link "Login"
    expect(current_path).to eq "/users"

    click_link "Logout"
    expect(current_path).to eq root_path

    click_link "Login"
    expect(current_path).to eq "/users"
    expect(page).to have_content("Margie")
    expect(page).to have_content("Logout")
  end
end
