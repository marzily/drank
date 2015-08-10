require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) do
    User.new({ name: "Margie",
               screen_name: "margie",
               uid: "12345",
               image_url: nil,
               oauth_token: "pancake",
               oauth_token_secret: "pancake with chocolate chips" })
  end

  let(:location) do
    { "city" => "Denver", "state" => "CO", "latitude" => "39.7392", "longitude" => "-104.9903" }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(UsersController).to receive(:location).and_return(location)
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
