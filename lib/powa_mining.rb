class PowaMining
  
  attr_accessor :k, :data, :map
  
  def initialize(k:, data:)
    @k = k
    @data = data
    @map = Array.new(data.length) {Array.new(data.length){0}}
    
    @profit = 0
    @count = 0
    @forbiden_range = []
    
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
  
  def build_map
    i_vector = (1..@data.length-1)
    for i in i_vector do
      for j in (i..@data.length-1) do
        @map[i][j] = @data[j] - @data[i-1]
      end
    end
    @map.shift
  end

  def show_matrix(map)
    puts "### MATRIX ###"
    map.each_with_index do |ele, ind|
      puts "line #{ind}: #{ele}"
    end
    puts "### END ###"
  end

  def max_profit
    p = []
    @map.each do |line|
        index = line.each_with_index.max[1]  
        p << [index, line.max] unless @forbiden_range.include? index
    end
    
      
    show_matrix p

    a = p.map{ |x| x[1]}
    a = p[a.each_with_index.max[1]].unshift(a.each_with_index.max[1])  
    
    pretty_print a
    
    puts "forbiden range"
    @forbiden_range += ((a[0]..a[1]).to_a)
    pretty_print @forbiden_range
  end

  def big_money
    if @k > 1
    
    else
      max_profit[2]
    end
  end

end
# BASIC TEST
pm = PowaMining.new(k: 1, data: [7,13,5,11,1,5,3,9,6,10])
pm.max_profit
pm.max_profit
pm.max_profit
pm.max_profit

