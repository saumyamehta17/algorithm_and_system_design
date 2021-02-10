// ArrayList, is a dynamic array and used when need to access random elements and can only add at end.
// We don't need to specify size
import java.util.*;

class ArrayListExample{
  public static void main(String[] args) {
    int n = 5;
    ArrayList<Integer> list = new ArrayList<>(n);

    // Adding elements to array
    for(int i = 0; i < n; i ++){
      list.add(i+1);
    }

    // Adding at index
    list.add(4, 10);
    System.out.println("List: " + list);

    // Changing element
    list.set(1, 20);
    System.out.println("After Setting List: " + list);

    // Removing element
    list.remove(1);  // index removal
    //list.remove(10); // object removal
    System.out.println("After Removal List: " + list);

    list.get(1);  // access element
    list.size();  // length of list

    //Iterating ArrayList
    Iterator itr = list.iterator();
    while(itr.hasNext()){
     System.out.println(itr.next());
    }

    // sorting
    Collections.sort(list);
  }
}