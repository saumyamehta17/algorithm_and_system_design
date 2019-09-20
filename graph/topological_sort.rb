class Adj
  attr_accessor :list

  def initialize
    @list = []
  end
end  
class Graph
  attr_reader :vc, :list, :error


  def initialize(vc)
    @vc = vc
    @list = Array.new(vc)
  end

  def self.build(vc)
    gh = Graph.new(vc)

    gh.vc.times do |v|
      gh.list[v] = Adj.new
    end
    gh
  end  

  def add_edge(src, dst)
    @list[src].list << dst unless list[src].list.include?(dst)
  end

  def print_it
    vc.times do |v|
      puts "#{v} -- #{list[v].list.join('-->')}"
    end  
  end 

  def helper(v, in_call_stack, visited, result)
    return true if in_call_stack[v]
    return false if visited[v]
    in_call_stack[v] = true
    visited[v] = true

    list[v].list.each do |a|
      if helper(a, in_call_stack, visited, result)
        return true
      end  
    end
    in_call_stack[v] = false
    result << v  
    false
  end 

  def topological
    in_call_stack = Array.new(vc, false)
    visited = Array.new(vc, false)
    result = Array.new

    vc.times do |v|
      if helper(v, in_call_stack, visited, result)
        @error = "There is cycle in graph"
        break
      end  
    end  

    puts error || result.to_s
  end  

end  

gh = Graph.build(6)
gh.add_edge(5,0)
gh.add_edge(5,2)
gh.add_edge(4,0)
gh.add_edge(4,1)
gh.add_edge(2,3)
gh.add_edge(3,1)
# gh.add_edge(1,2)
# gh.add_edge(0,2)
gh.print_it
gh.topological