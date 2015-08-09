require 'rails_helper'

RSpec.describe User, type: :model do
  let(:location) do
    Location.new
  end

  let(:address_components) do
    [ {"long_name"=>"1437", "short_name"=>"1437", "types"=>["street_number"]},
      {"long_name"=>"Bannock Street", "short_name"=>"Bannock St", "types"=>["route"]},
      {"long_name"=>"Civic Center", "short_name"=>"Civic Center", "types"=>["neighborhood", "political"]},
      {"long_name"=>"Denver", "short_name"=>"Denver", "types"=>["locality", "political"]},
      {"long_name"=>"Denver County", "short_name"=>"Denver County", "types"=>["administrative_area_level_2", "political"]},
      {"long_name"=>"Colorado", "short_name"=>"CO", "types"=>["administrative_area_level_1", "political"]},
      {"long_name"=>"United States", "short_name"=>"US", "types"=>["country", "political"]},
      {"long_name"=>"80202", "short_name"=>"80202", "types"=>["postal_code"]} ]
  end

  before(:each) do
    allow_any_instance_of(Location).to receive(:address_components).and_return(address_components)
  end

  scenario "location has a neighborhood" do
    expect(location.neighborhood).to eq "Civic Center"
  end

  scenario "location has a city" do
    expect(location.city).to eq "Denver"
  end

  scenario "location has a state" do
    expect(location.state).to eq "CO"
  end
end
