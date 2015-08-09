require "rails_helper"

RSpec.feature "weather display on user show page", type: :feature do
  let(:user) do
    User.create({  name: "Margie",
                   screen_name: "margie",
                   uid: "12345",
                   image_url: nil,
                   oauth_token: "pancake",
                   oauth_token_secret: "pancake with chocolate chips" })
  end

  let(:weather_data) do
    { city: "Denver", state: "CO", temperature: "88" }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(UsersController).to receive(:weather_data).and_return(weather_data)
    visit users_show_path
  end

  scenario "displays user's name" do
    expect(current_path).to eq "/users/show"
    expect(page).to have_content "Margie"
  end

  scenario "displays user's location" do
    expect(page).to have_content(weather_data[:city])
    expect(page).to have_content(weather_data[:state])
  end

  scenario "displays current weather for location" do
    expect(page).to have_content(weather_data[:weather])
  end
end
