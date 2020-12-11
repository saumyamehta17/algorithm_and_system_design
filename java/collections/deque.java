import java.util.*;
class DequeExample{
  public static void main(String[] args){
    Deque<Integer> deq = new LinkedList<>();
    deq.addFirst(1);
    deq.addFirst(2);
    deq.addLast(10);
    System.out.println("Deq " + deq);

    deq.removeLast();
    System.out.println("Deq " + deq);

    System.out.println("First " + deq.getFirst());
    System.out.println("Last " + deq.getLast());
  }
}