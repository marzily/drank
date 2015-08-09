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

  let(:display_data) do
    { city: "Denver", state: "CO", temperature: "88" }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(UsersController).to receive(:display_data).and_return(display_data)
    visit users_show_path
  end

  scenario "displays user's name" do
    expect(current_path).to eq "/users/show"
    expect(page).to have_content "Margie"
  end

  scenario "displays user's location" do
    expect(page).to have_content(display_data[:city])
    expect(page).to have_content(display_data[:state])
  end

  scenario "displays current weather for location" do
    expect(page).to have_content(display_data[:weather])
  end
end


# require "rails_helper"
#
# RSpec.feature "user site access", type: :feature do
#   include Capybara::DSL
#   let(:display_data) do
#     { city: "Denver", state: "CO", weather: "88" }
#   end
#
#   before(:each) do
#     Capybara.app = Drank::Application
#     OmniAuth.config.test_mode = true
#     OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
#       provider: 'twitter',
#       info: { name:     "Margie",
#               nickname: "marzily" },
#       uid: "123",
#       image_url: "something",
#       credentials: { token: "pancake",
#                      secret: "chocolate chip pancake" }
#     })
#
#     allow_any_instance_of(UsersController).to receive(:display_data).and_return(display_data)
#   end
#
#   scenario "logging in with twitter omniauth" do
#     visit "/"
#     expect(page.status_code).to eq 200
#     expect(current_path).to eq root_path
#
#     click_link "Login"
#     expect(current_path).to eq "/users/show"
#     expect(page).to have_content("Margie")
#     expect(page).to have_content("Logout")
#   end
#
#   scenario "logging out" do
#     visit "/"
#     click_link "Login"
#     expect(current_path).to eq "/users/show"
#
#     click_link "Logout"
#     expect(current_path).to eq root_path
#     expect(page).to_not have_content("Margie")
#   end
# end
