class PowaMining
  
  attr_accessor :k, :data
  attr_reader :map, :profit, :deals, :last_profit 

  def initialize(k:, data:)
    @k = k
    @data = data
    @map = Array.new(data.length) {Array.new(data.length){0}}
    
    @profit = 0
    @count = 0
    @forbiden_range = []
    @deals = []
    @last_profit = 0

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

    a = p.map{ |x| x[1]}
    a = p[a.each_with_index.max[1]].unshift(a.each_with_index.max[1])  
    
    #pretty_print a
    @profit += a[2]
    @deals << a
    #puts "forbiden range"
    @forbiden_range += ((a[0]..a[1]).to_a)
    #pretty_print @forbiden_range
      
    #puts @profit
  end

  def big_money
    i = 1
    while i <= @k do
      unless @forbiden_range.length == @data.length
        max_profit
      end

      if i < @k && @forbiden_range.length == @data.length
        #puts "PIVOT CHANGING"
        @map[@deals[0][0]][@deals[0][1]] = 0
        #show_matrix @map
        @last_profit = @profit
        @profit = 0
        @deals = []
        @forbiden_range = []
        i = 1
      end
      
      if @last_profit > @profit
        #puts "PIVOT CHANGING"
        @map[@deals[0][0]][@deals[0][1]] = 0
        #show_matrix @map
        @last_profit = 0
        @profit = 0
        @deals = []
        @forbiden_range = []
        i = 1
      end

      i += 1
      #puts"--#{i}--"
    end
  end

end
# BASIC TEST
#pm = PowaMining.new(k: 5, data: [7,13,5,11,1,5,3,9,6,10])
#pm = PowaMining.new(k: 2, data: [1,7,3,9,10])
#pm.big_money
#puts pm.profit
#puts pm.last_profit
#puts pm.show_matrix pm.deals
