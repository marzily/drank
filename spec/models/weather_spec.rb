require 'rails_helper'

RSpec.describe Weather, type: :model do
  describe "valid attributes" do
    it "has a min temp if max temp is nil" do
      weather = Weather.new(min_temp: 80, max_temp: nil)
      expect(weather).to be_valid
    end

    it "has a max temp if min temp is nil" do
      weather = Weather.new(min_temp: nil, max_temp: 60)
      expect(weather).to be_valid
    end

    it "is valid if it has both a min temp and a max temp" do
      weather = Weather.new(min_temp: 70, max_temp: 80)
      expect(weather).to be_valid
    end
  end

  describe "invalid attributes" do
    it "is invalid if both min temp and max temp are empty" do
      weather = Weather.new(min_temp: nil, max_temp: nil)
      expect(weather).to_not be_valid
    end

    it "is invalid if the min temp is greater than the max temp" do
      weather = Weather.new(min_temp: 80, max_temp: 70)
      expect(weather).to_not be_valid
    end
  end

  it "has many drinks" do
    weather = Weather.create(min_temp: 70, max_temp: 80)
    expect(weather).to respond_to(:drinks)
  end

  describe "current_conditions" do
    it "doesn't return a temperature if city is missing" do
      temp = Weather.current_conditions(nil, "CO")
      expect(temp).to be_nil
    end

    it "doesn't return a temperature if state is missing" do
      temp = Weather.current_conditions("Denver", nil)
      expect(temp).to be_nil
    end

    it "doesn't return a temperature if citstate is missing" do
      allow(Weather).to receive(:temperature).and_return("80")
      temp = Weather.current_conditions("Denver", "CO")
      expect(temp).to eq "80"
    end
  end

  describe "temperature ranges" do
    before(:each) do
      Weather.create(min_temp: nil, max_temp: 69)
      Weather.create(min_temp: 70, max_temp: 89)
      Weather.create(min_temp: 90, max_temp: nil)
    end

    it "returns the cold temperature range" do
      expect(Weather.cold.min_temp).to be_nil
    end

    it "returns the mild temperature range" do
      expect(Weather.mild.min_temp).to eq 70
    end

    it "returns the hot temperature range" do
      expect(Weather.hot.min_temp).to eq 90
    end

    it "returns the appropriate temperature range given the current temp" do
      expect(Weather.current_range(88).min_temp).to eq 70
      expect(Weather.current_range(50).min_temp).to be_nil
      expect(Weather.current_range(95).min_temp).to eq 90
    end
  end
end
