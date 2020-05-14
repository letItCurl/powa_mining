# SPEC FOR PowaMinnig

require 'powa_mining'

RSpec.describe PowaMining do
  context "#get_inputs" do
    it "should return the inputs as a hash" do
      pw = PowaMining.new(k: 5, data: [1,2,3]) 
      expect(pw.get_inputs).to eq({k: 5, data: [1,2,3]})
    end
  end
  describe "#big_money" do
    before do
      @context_one = {k: 2, data: [1,7,3,9,10]}
      @context_two = {k: 1, data: @context_one[:data]}
      @context_three = {k: 1, data: [10,1,7,14]}
      
      @pw_one = PowaMining.new(k: @context_one[:k], data: @context_one[:data])
      @pw_two = PowaMining.new(k: @context_two[:k], data: @context_two[:data])   
      @pw_three = PowaMining.new(k: @context_three[:k], data: @context_three[:data]) 
    end
    
    describe "#build_map" do
      
      it "should build the map correctly (context 1)" do
        map = [[1, 7, 3, 9, 10],
               [0, 6, 2, 8,  9],
               [0, 0,-4, 2,  3],
               [0, 0, 0, 6,  7],
               [0, 0, 0, 0,  1],]
        
        expect(@pw_one.map).to eq(map)
      end

      it "should build the map correctly (context 3)" do
        map = [[10, 1, 7, 14],
               [ 0,-9,-3,  4],
               [ 0, 0, 6, 13],
               [ 0, 0, 0,  7]]

        expect(@pw_three.map).to eq(map)
      end
    
    end
    
    describe "case: k = 1" do
    
      it 'should return the maximum difference of the map of context 2' do
        expect(@pw_two.big_money).to eq(9)
      end

      it 'should return the maximum difference of the map of context 3' do
        expect(@pw_three.big_money).to eq(13)
      end
    
    end
    
    xit "should return the maximum profit with context 1"do 
      expect(@pw_one.big_money).to eq(13)
    end
  
  end
end
