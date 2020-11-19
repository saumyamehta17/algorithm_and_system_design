// Linkedlist, stores items in containers. each containers has link to next containers
// add items at first or mid
// No Random item accessibility
// Operations: add, addFirst, addLast, remove, removeFirst, removeLast, add(indx, item), remove(indx)
//     set(indx, item)
import java.util.LinkedList;

class LinkedListExample{
    public static void main(String[] args){
        LinkedList<String> list = new LinkedList<String>();
        list.add("A");
        list.add("B");
        list.addFirst("C");
        list.addLast("D");
        list.add(2, "E");
        System.out.println("List: " + list);

        list.remove("D");
        list.remove(1);
        System.out.println("List: " + list);

        // Changing item
        list.set(1, "Changed");
        System.out.println("List: " + list);

        //iterating list
        for(int i = 0; i < 4; i++){
          list.add("Add"+i);
        }
    }
}

