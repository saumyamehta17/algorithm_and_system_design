import java.util.*;
class Graph{
 int v;
 ArrayList<ArrayList> list = new ArrayList<>();

 // constructor
 Graph(int v){
  this.v = v;
  for(int i = 0; i < v; i++){
    list.add(new ArrayList<Integer>());
  }
 }

 void addEdge(int source, int destination){
   list.get(source).add(destination);
 }

 ArrayList topoSort(){
   ArrayList<Integer> result = new ArrayList<>();
   Stack<Integer> stack = new Stack<>();
   Set<Integer> visited = new HashSet<>();

   for(int i = 0; i < v; i++){
     if(!visited.contains(i)){
        helper(i, visited, stack);
     }
   }

   while(!stack.isEmpty()){
     result.add(stack.pop());
   }
   return result;
 }

 void helper(int vertex, Set visited, Stack stack){
    visited.add(vertex);
    Iterator<Integer> itr = list.get(vertex).iterator();
    while(itr.hasNext()){
      Integer i = itr.next();
      if(!visited.contains(i)){
        helper(i, visited, stack);
      }
    }
    // for(Integer i:list.get(vertex)){
    //   if(!visited.contains(i)){
    //     helper(i, visited, stack);
    //   }
    // }

    stack.push(vertex);
 }
}

class GraphExample{
 public static void main(String[] args){
   Graph graph = new Graph(6);
    graph.addEdge(5, 0);
    graph.addEdge(4, 0);
    graph.addEdge(4, 1);
    graph.addEdge(5, 2);
    graph.addEdge(2, 3);
    graph.addEdge(3, 1);

    System.out.println("Topological Sort: " + graph.topoSort());
 }
}