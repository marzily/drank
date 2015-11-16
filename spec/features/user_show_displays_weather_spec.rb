require "rails_helper"

RSpec.feature "weather display on user show page", type: :feature, js: true do
  let(:user) do
    User.create({ name: "Margie",
                  screen_name: "margie",
                  uid: "12345",
                  image_url: nil,
                  oauth_token: "pancake",
                  oauth_token_secret: "pancake with chocolate chips" })
  end

  let(:session) do
    { temp_f: '88',
      location: { "latitude" => "39.7392",
                  "longitude" => "-104.9903" },
      user_id: user.id }
  end

  let(:drink) { Drink.create(drink_type: "iced tea") }

  before(:each) do
    Weather.create(min_temp: nil, max_temp: 69)
    Weather.create(min_temp: 70, max_temp: 89)
    Weather.create(min_temp: 90, max_temp: nil)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(UsersController).to receive(:session).and_return(session)
    visit users_path
  end

  scenario "displays user's name" do
    expect(current_path).to eq "/users"
    expect(page).to have_content "Margie"
  end

  scenario "displays user's location" do
    # save_and_open_page
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")
  end

  xscenario "displays current weather for location" do
    expect(page).to have_content("88")
  end
end
