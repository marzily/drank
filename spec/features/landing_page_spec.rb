require "rails_helper"

RSpec.feature "landing page", type: :feature do
  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)
    visit root_path
  end

  it "has the name of the app" do
    expect(page).to have_content "Drank"
  end

  it "has a link to login" do
    expect(page).to have_button "Login"
  end
end
