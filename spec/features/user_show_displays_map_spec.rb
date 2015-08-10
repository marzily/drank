require "rails_helper"

RSpec.feature "map display on user show page", type: :feature do
  let(:user) do
    User.create({ name: "Margie",
                  screen_name: "margie",
                  uid: "12345",
                  image_url: nil,
                  oauth_token: "pancake",
                  oauth_token_secret: "chocolate chip pancakes" })
  end

  let(:session) do
    { 'location' => { "city" => "Denver",
                      "state" => "CO",
                      "latitude" => "39.7392",
                      "longitude" => "-104.9903" } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:session).and_return(session)
    allow_any_instance_of(UsersHelper).to receive(:current_conditions).and_return("88")
    visit users_show_path
  end

  scenario "displays map" do
    expect(current_path).to eq "/users/show"
    expect(page).to have_css("img[src*='https://maps.googleapis.com/maps/api/staticmap?center=#{session['location']['latitude']},#{session['location']['longitude']}&zoom=14&size=600x600']")
  end
end
