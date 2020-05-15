# SPEC FOR PowaMinnig

require 'powa_mining'

RSpec.describe PowaMining do
  describe "#big_money" do
    before do
      @context_one = {k: 2, data: [1,7,3,9,10]}
      @context_two = {k: 1, data: @context_one[:data]}
      @context_three = {k: 1, data: [10,1,7,14]}
      @context_four = {k: 1, data: [7,13,5,11,1,5,3,9,6,10]} 
      

      @pw_one = PowaMining.new(k: @context_one[:k], data: @context_one[:data])
      @pw_two = PowaMining.new(k: @context_two[:k], data: @context_two[:data])   
      @pw_three = PowaMining.new(k: @context_three[:k], data: @context_three[:data]) 
      @pw_four = PowaMining.new(k: @context_four[:k], data: @context_four[:data])
    end
    
    describe "#build_map" do
      
      it "should build the map correctly (context 1)" do
        map = [[0, 6, 2, 8,  9],
               [0, 0,-4, 2,  3],
               [0, 0, 0, 6,  7],
               [0, 0, 0, 0,  1],]
        
        expect(@pw_one.map).to eq(map)
      end

      it "should build the map correctly (context 3)" do
        map = [[ 0,-9,-3,  4],
               [ 0, 0, 6, 13],
               [ 0, 0, 0,  7]]

        expect(@pw_three.map).to eq(map)
      end
    
      describe "case: k = 1" do
        it 'should return the maximum difference of the map of context 2' do
          @pw_two.big_money
          expect(@pw_two.profit).to eq(9)
        end

        it 'should return the maximum difference of the map of context 3' do
          @pw_three.big_money
          expect(@pw_three.profit).to eq(13)
        end
      end
    
      describe "context 1" do
        it "should return the maximum profit"do 
          @pw_one.big_money
          expect(@pw_one.profit).to eq(13)
        end
      end
    
      describe "context 4" do  
        it "should return the maximum profit with k 1"do 
          @pw_four.big_money
          expect(@pw_four.profit).to eq(9)
        end 
      
        it "should return the maximum profit with k 2"do 
          @pw_four.k = 2
          @pw_four.big_money
          expect(@pw_four.profit).to eq(15)
        end

        it "should return the maximum profit with k 3"do 
          @pw_four.k = 3
          @pw_four.big_money
          expect(@pw_four.profit).to eq(21)
        end

        it "should return the maximum profit with k 4"do 
          @pw_four.k = 4
          @pw_four.big_money
          expect(@pw_four.profit).to eq(24)
        end

        it "should return the maximum profit with k 5"do 
          @pw_four.k = 5
          @pw_four.big_money
          expect(@pw_four.profit).to eq(26)
        end
      end
    end
  end
end
