# spec/models/item_spec.rb
require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#isWorth" do
    it "should return true if at least one median is superior to it's current price" do
      item = Item.new(unit_price: [2,0,6,7,1,8],tenth_price: [20,0,70,10,15,15],hundred_price: [125,115,140,115,130,170])
      expect(item.isWorth).to eq(true)
    end

    it "should return false if no median is superior to it's current price" do
      item = Item.new(unit_price: [2,0,6,7,1,8],tenth_price: [20,0,70,10,15,70],hundred_price: [125,115,140,115,130,170])
      expect(item.isWorth).to eq(false)
    end
  end

  describe "#price_median"do
    it "Should return the  medianp rice" do
      item = Item.new(unit_price: [2,0,6,7,1,8],tenth_price: [20,0,70,10,15,70],hundred_price: [125,115,140,115,130,170])
      expect(item.price_median(:unit_price)).to eq(6)
      expect(item.price_median(:tenth_price)).to eq(20)
      expect(item.price_median(:hundred_price)).to eq(127)
    end
  end

 
end
