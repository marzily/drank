require "rails_helper"

RSpec.feature "weather display on user show page", type: :feature do
  let(:user) do
    User.create({ name: "Margie",
                  screen_name: "margie",
                  uid: "12345",
                  image_url: nil,
                  oauth_token: "pancake",
                  oauth_token_secret: "pancake with chocolate chips" })
  end

  let(:session) do
    { 'location' => { "city" => "Denver",
                      "state" => "CO",
                      "latitude" => "39.7392",
                      "longitude" => "-104.9903" } }
  end

  let(:drink) { Drink.create(drink_type: "iced tea") }

  before(:each) do
    Weather.create(min_temp: nil, max_temp: 69)
    Weather.create(min_temp: 70, max_temp: 89)
    Weather.create(min_temp: 90, max_temp: nil)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:session).and_return(session)
    allow_any_instance_of(UsersHelper).to receive(:current_conditions).and_return("88")
    allow_any_instance_of(UsersHelper).to receive(:drinks_by_temp).and_return([drink])
    visit users_path
  end

  scenario "displays user's name" do
    expect(current_path).to eq "/users"
    expect(page).to have_content "Margie"
  end

  scenario "displays user's location" do
    expect(page).to have_content(session['location']["city"])
    expect(page).to have_content(session['location']["state"])
  end

  scenario "displays current weather for location" do
    expect(page).to have_content("88")
  end
end
