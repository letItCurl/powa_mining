class PowaMining
  
  attr_accessor :k, :data, :map
  
  def initialize(k:, data:)
    @k = k
    @data = data
    @map = Array.new(data.length) {Array.new(data.length){0}}
    
    @profit = 0
    @count = 0
    @forbiden_pos = []
    
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

  def show_map
    puts "### MAP ###"
    @map.each_with_index do |ele, ind|
      puts "line #{ind}: #{ele}"
    end
    puts "### END ###"
  end

  def max_profit_k1 
      p = []
      @map.each_with_index do |line, index|
        p << line.max
      end
      p.shift
      @profit = p.max
  end

  def big_money
    if @k > 1
    
    else
      max_profit_k1
    end
  end

end
# BASIC TEST
pm = PowaMining.new(k: 1, data: [7,13,5,11,1,5,3,9,6,10])
pm.show_map
