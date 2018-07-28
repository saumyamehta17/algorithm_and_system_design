class Adj
  attr_accessor :list

  def initialize
    @list = []
  end
end  
class Graph
  attr_reader :vc, :list


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
    @list[src].list << dst #unless list[src].list.include?(dst)
  end

  def print_it
    vc.times do |v|
      puts "#{v} -- #{list[v].list.join('-->')}"
    end  
  end  

  def topological_sort
    s = []
    visited = Array.new(vc, false)

    vc.times do |v|
      if visited[v] == false
        topological_sort_util(v, visited, s)
      end  
    end  

    while(!s.empty?)
      print "#{s.pop} "
    end  
  end 

  def topological_sort_util(v, visited, s)
    visited[v] = true

    adjacents = list[v].list
    adjacents.each do |a|
      if visited[a] == false
        topological_sort_util(a, visited, s)
      end  
    end

    s.push(v)  
  end 
end  

gh = Graph.build(6)
gh.add_edge(5,0)
gh.add_edge(5,2)
gh.add_edge(4,0)
gh.add_edge(4,1)
gh.add_edge(2,3)
gh.add_edge(3,1)
# gh.print_it
gh.topological_sort
