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
   System.out.println("ADJ: " + graph.list);
 }
}