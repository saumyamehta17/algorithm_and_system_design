Node = Struct.new(:buy, :sell)

class StockBuySell
  attr_accessor :prices, :count, :n, :sol

  def initialize(prices)
    @prices = prices
    @count = 0
    @sol = []
    @n = prices.length
  end

  def process
    i = 0
    while(i < n-1)
      while(i < n-1 && prices[i] >= prices[i+1])
        i += 1
      end

      if(i == n-1)
        break
      end
      @sol[count] = Node.new(i)
      i+=1

      while (i<n && prices[i] >= prices[i-1])
        i += 1
      end 

      @sol[count].sell = i-1
      # i += 1
      @count += 1
      end
  end  

  def print_it
    sol.each do |s|
      puts "buy at #{s.buy} and sell at #{s.sell}"
    end  
  end  
end  

s = StockBuySell.new([100, 180, 260, 310, 40, 535, 695])
s.process
s.print_it