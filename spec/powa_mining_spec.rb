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
      @pw_one = PowaMining.new(k: @context_one[:k], data: @context_one[:data])
    end
    describe "#build_map" do
      it "should build the map correctly (context_one)" do
        map = [[1, 7, 3, 9, 10],
               [0, 6, 2, 8,  9],
               [0, 0,-4, 2,  3],
               [0, 0, 0, 6,  7],
               [0, 0, 0, 0,  1],]
        @pw_one.build_map
        expect(@pw_one.map).to eq(map)
      end
    end
    xit "should return the maximum profit with @context_one"do 
      expect(@pw_one.big_money).to eq(13)
    end
  end
end
