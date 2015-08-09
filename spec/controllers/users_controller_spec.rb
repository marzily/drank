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

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
end
