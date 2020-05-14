class PowaMining
  
  attr_reader :k, :data, :map
  
  def initialize(k:, data:)
    @k = k
    @data = data
    @map = Array.new(data.length) {Array.new(data.length){0}}
    @profit = 0
    @count = 0

    self.build_map
  end

  def pretty_print(what)
    puts "###print nb:#{@count}###"
    if what 
      puts what.join(',')
      puts "################"
    else
      puts "K transaction:"
      puts @k
      puts "Data array:"
      puts @data.join(',')
      puts "################"
    end
    @count += 1
  end

  def get_inputs
    {k: @k, data: @data}
  end
  
  def build_map
    @map[0] = @data

    i_vector = (1..@data.length-1)
  
    for i in i_vector do
      for j in (i..@data.length-1) do
        @map[i][j] = @data[j] - @data[i-1]
      end
    end
  end

  def big_money
    @profit
  end

end
# BASIC TEST
# pm = PowaMining.new(k: 5, data: [1,7,3,9,10])
