require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new({ name: "Margie",
               screen_name: "margie",
               uid: "12345",
               image_url: nil,
               oauth_token: "pancake",
               oauth_token_secret: "pancake with chocolate chips" })
  end

  # let(:auth_info) do
  #   { provider: 'twitter',
  #     info: { name:     "Margie",
  #             nickname: "marzily" },
  #     uid: "123",
  #     image_url: "something",
  #     credentials: { token: "pancake",
  #                    secret: "chocolate chip pancake" } }
  #   end

  context "valid attributes" do
    scenario "user can be created with valid attributes" do
      expect(user).to be_valid
    end

  end
end
