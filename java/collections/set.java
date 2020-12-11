// Set, is an interface so use class(HashSet) which use this interface
// set methods: addAll, retainAll, removeAll
import java.util.*;

class SetExample{
  public static void main(String[] args){
    Set<String> set = new HashSet<String>();
    set.add("doctor");
    set.add("engineer");
    System.out.println("Set: " + set);
  }
}

Set<Integer> setA = new HashSet<Integer>();
Set<Integer> setA = new HashSet<Integer>();
Integer a[] = {0,1,2,3,5,6,7};
for(Integer x:a){
 setA.add(x);
}

Set<Integer> setB = new HashSet<Integer>();
Integer b[] = {2,4,5,6,7,8};
for(Integer x:b){
 setB.add(x);
}

System.out.println("A: " + setA);
System.out.println("B: " + setB);

//  -> Union
setA.addAll(setB);
System.out.println("Union: " + setA);

//  -> Intersection
setA.retainAll(setB);
System.out.println("Intersection: " + setA);

//  -> difference
setA.removeAll(setB);
System.out.println("Diff: " + setA);

// Sorted Set, (insertion order is not maintained, values stored in asc order)
Set<String> sorted_set = new HashSet<String>();
sorted_set.add("B");
sorted_set.add("B");
sorted_set.add("A");
System.out.println("Set: " + sorted_set) // ["A", "B"]

// Accessing Elements
sorted_set.contains("A");

// Removing Element
sorted_set.remove("A");

// interate through Set
for(String x:sorted_set){
System.out.println("value: "+x);
}