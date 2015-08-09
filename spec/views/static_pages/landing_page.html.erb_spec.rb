require 'rails_helper'

RSpec.describe "static_pages/landing_page.html.erb", type: :view do
  before(:each) do
    assign(:current_user, nil)
  end

  it "has the name of the app" do
    render
    # expect(response).to have_http_status(:success)
    rendered.should contain("Drank")
  end
end
