require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  let(:session) do
    { 'location' => { "city" => "Denver",
                      "state" => "CO",
                      "latitude" => "39.7392",
                      "longitude" => "-104.9903" } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:session).and_return(session)
    allow(Weather).to receive(:current_conditions).and_return("88")
  end

  it "returns the location hash" do
    expect(location).to eq(session['location'])
  end

  it "returns the current weather conditions" do
    expect(current_conditions).to eq "88"
  end
end
