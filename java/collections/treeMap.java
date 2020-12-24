// TreeMap similar to hashMap with only difference i.e TreeMap is sorted in the ascending order od its keys but haspMap is an unordered collection.
// TreeMap is unsynchronized so not thread-safe

import java.util.TreeMap;
import java.util.Set;
import java.util.Iterator;

class TreeMapExample{
  public static void main(String args[]){
    TreeMap<Integer, String> tree_map = new TreeMap<>();

    // adding elements
    tree_map.put(3, "Jair Bolsonaro");
    tree_map.put(2, "Biden");
    tree_map.put(1, "Vladimir Putin");

    // iterator
    for(Integer i : tree_map.keySet()){
      System.out.println("Key: " + i + " Value: " + tree_map.get(i));
    }

    // display using iterator
    Set set = tree_map.entrySet();
    System.out.println("Set: " + set);
    Iterator itr = set.iterator();
    while(itr.hasNext()){
      System.out.println("----" + itr.next());
    }
  }
}