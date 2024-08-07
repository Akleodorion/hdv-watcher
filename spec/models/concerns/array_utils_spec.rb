require 'rails_helper'

RSpec.describe ArrayUtils do
  let(:dummy_class) { Class.new {extend ArrayUtils} }

  describe '#clear_zero' do
    it "should return a zero less array" do
      test_array1 = [0,1,2,0,5]
      test_array2 = []
      expect(dummy_class.clear_zero(test_array1)).to eq([1,2,5])
      expect(dummy_class.clear_zero(test_array2)).to eq([])
    end
  end

  describe '#clear_doubles' do
    it "Should return a double less array" do
      test_array1 = [0,1,2,2,0,0,5]
      test_array2 = []
      expect(dummy_class.clear_doubles(test_array1)).to eq([0,1,2,0,5])
      expect(dummy_class.clear_doubles(test_array2)).to eq([])
    end
  end

  describe '#sort_array' do
    it "Should sort the array in ascending order" do
      test_array1 = [0,2,5,1,6]
      test_array2 = []
      expect(dummy_class.sort_array(test_array1)).to eq([0,1,2,5,6])
      expect(dummy_class.sort_array(test_array2)).to eq([])
    end
  end


  describe '#calculate median' do

    it "Shoudl return 0 when the array is full of 0" do
      test_array = [0,0,0,0,0,0]
      expect(dummy_class.calculate_median(test_array)).to eq(0)
    end

    context "When the cleared array is empty" do
      it "should return 0" do
        test_array = [1]
        expect(dummy_class.calculate_median(test_array)).to eq(1)
      end
    end

    context "when the cleared array is not empty" do

       context "when the array length is even" do
         it "should return the valid median" do
           test_array = [1,2,3,5]
           expect(dummy_class.calculate_median(test_array)).to eq(2)
         end
       end

       context 'when the array length is odd' do
        it "should return the valid median" do
          test_array = [1,2,3,5,6]
          expect(dummy_class.calculate_median(test_array)).to eq(3)
        end
       end
    end
  end


  describe '#split_array_into_batches' do
    it "should split the array into batches of different numbers" do
      test_array = [1,2,5,41,2,35,4,2,1,2]
      expect(dummy_class.split_array_into_batches(test_array,2).count).to eq(5)
      expect(dummy_class.split_array_into_batches(test_array,2)).to eq ([[1,2],[5,41],[2,35], [4,2], [1,2]])
    end

    it "should split the array into batches of different numbers" do
      test_array = [1,2,5,41,2,35,4,2,1,2,21]
      expect(dummy_class.split_array_into_batches(test_array,2).count).to eq(6)
      expect(dummy_class.split_array_into_batches(test_array,2)).to eq ([[1,2],[5,41],[2,35], [4,2], [1,2], [21]])
    end
  end

  describe "#sort_by_median" do
    it "Should return a sorted list of item" do
    item1 = Item.new(unit_price: [2,0,6,7,1,8],tenth_price: [35,125,0,42,25,12],hundred_price: [1212,1524,1256,2515,2356,2510])
    item2 = Item.new(unit_price: [3,8,7,8,12,15],tenth_price: [15,75,45,65,32,23],hundred_price: [152,165,185,174,156,165])
    item3 = Item.new(unit_price: [3,4,8,6,10,12],tenth_price: [56,78,98,65,32,12],hundred_price: [152,654,458,845,658,988])
    items = [item1,item2,item3]

    expect(dummy_class.sort_by_median(items,:unit_price)).to eq([item1,item3,item2])
    expect(dummy_class.sort_by_median(items,:tenth_price)).to eq([item1,item2,item3])
    expect(dummy_class.sort_by_median(items,:hundred_price)).to eq([item2,item3,item1])
    end
  end
end