# SPEC FOR PowaMinnig

require 'powa_mining'

RSpec.describe PowaMining do
  context "#get_inputs" do
    it "should return the inputs as a hash" do
      pw = PowaMining.new(k: 5, data: [1,2,3]) 
      expect(pw.get_inputs).to eq({k: 5, data: [1,2,3]})
    end
  end
end
