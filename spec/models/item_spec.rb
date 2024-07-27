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
end
