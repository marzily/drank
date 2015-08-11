require 'rails_helper'

RSpec.describe Drink, type: :model do
  let(:valid_attributes) {
    { drink_type: "slushy" }
  }

  let(:invalid_attributes) {
    { drink_type: nil }
  }

  it "is valid with a drink type" do
    expect(Drink.new(valid_attributes)).to be_valid
  end

  it "is invalid without a drink type" do
    expect(Drink.new(invalid_attributes)).to_not be_valid
  end
end
