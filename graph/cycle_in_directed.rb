class Graph
  attr_accessor :vc, :adjacents, :visited_arr, :instack

  def initialize(vc)
    @vc = vc
    @adjacents = Array.new(vc) {Array.new}
    @visited_arr = []
    @instack = []
  end

  def add_edge(src, dst)
    @adjacents[src] << dst if !@adjacents[src].include?(dst)
  end

  def is_cycle
    vc.times do |v|
      if cycle_util(v)
        return true
      end  
    end
    
    return false  
  end  

  def cycle_util(v)
    if instack[v]
      return true
    end
    
    if visited_arr[v]
      return false
    end

    instack[v] = true
    visited_arr[v] = true

    adj = adjacents[v]
    adj.each do |a|
      if cycle_util(a)
        return true
      end  
    end
    instack[v] = false  
  end
end  

gh = Graph.new(3)
# gh.add_edge(0,1)
# gh.add_edge(1,2)
# gh.add_edge(2,0)

gh.add_edge(0,1)
gh.add_edge(1,2)
gh.add_edge(2,2)
puts "Cycle exist -> #{gh.is_cycle}"