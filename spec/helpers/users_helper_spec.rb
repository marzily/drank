require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  let(:session) do
    { temp_f: '88',
      location: { "city" => "Denver",
                  "state" => "CO",
                  "latitude" => "39.7392",
                  "longitude" => "-104.9903" } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:session).and_return(session)
  end

  it "returns the location hash" do
    expect(location).to eq(session[:location])
  end

  it "returns the current weather conditions" do
    expect(session[:temp_f]).to eq "88"
  end

  it "returns drinks for a given temperature" do
    cold = Weather.create(min_temp: nil, max_temp: 69)
    mild = Weather.create(min_temp: 70, max_temp: 89)
    hot = Weather.create(min_temp: 90, max_temp: nil)
    mild.drinks.create(drink_type: "iced tea")
    allow(Weather).to receive(:mild).and_return(mild)

    expect(drinks_by_temp.count).to eq 1
    expect(drinks_by_temp.first.drink_type).to eq "iced tea"
  end
end
