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

  let(:location) do
    { "city" => "Denver", "state" => "CO", "latitude" => "39.7392", "longitude" => "-104.9903" }
  end

  let(:current_conditions) { "88" }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(UsersHelper).to receive(:location).and_return(location)
    allow_any_instance_of(UsersHelper).to receive(:current_conditions).and_return(current_conditions)
    visit users_show_path
  end

  scenario "displays user's name" do
    expect(current_path).to eq "/users/show"
    expect(page).to have_content "Margie"
  end

  scenario "displays user's location" do
    expect(page).to have_content(location["city"])
    expect(page).to have_content(location["state"])
  end

  scenario "displays current weather for location" do
    expect(page).to have_content(current_conditions)
  end
end
