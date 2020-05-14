class PowaMining
  
  attr_reader :k, :data
  
  def initialize(k:, data:)
    @k = k
    @data = data
  end

  def pretty_print
    puts "################"
    puts "K transaction:"
    puts @k
    puts "Data array:"
    puts @data.join(',')
    puts "################"
    {k: @k, data: @data}
  end

  def get_inputs
    {k: @k, data: @data}
  end

end
# BASIC TEST
#pm = PowaMining.new(k: 5, data: [1,2,3,4,5])
#pm.pretty_print
