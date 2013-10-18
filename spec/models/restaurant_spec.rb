require 'spec_helper'

describe Restaurant do

  it "restaurant#convert_address should return coordinates" do
    restaurant = Restaurant.new(name: "Franklin Barbecue", address: "900 E 11th St  Austin, TX 78702")
    restaurant.convert_address()

    expect(restaurant.latitude).to eq(30.270178)
    expect(restaurant.longitude).to eq(-97.731262)
  end

  it "restaurant#place_type_display should return a displayable place type" do
    restaurant = Restaurant.new(name: "Franklin Barbecue", address: "900 E 11th St  Austin, TX 78702", place_type: "fast-food")
    restaurant.place_type_display()

    expect(restaurant.place_type_display).to eq("Fast Food")
  end

  it { should belong_to(:map) }
end