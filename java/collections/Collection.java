// Queue and its operations(remove, peek, size)
import java.util.Queue;
import java.util.LinkedList;

public class QueueExample{

  public static void main(String[] args){
    Queue<Integer> que = new LinkedList<>();
    que.add(1);
    que.add(2);
    que.add(9);


    System.out.println("Queue elements: " + que);
    System.out.println("Queue size: " + que.size());
    System.out.println("Top Element: " + que.peek());
    System.out.println("Remove Element: " + que.remove());
    System.out.println("Queue elements: " + que);
    System.out.println("Queue size: " + que.size());
  }
}


// Stack
import java.util.*;

public class StackExample{
  public static void main(String[] args){
    Stack<Integer> stack = new Stack<Integer>();

    stack.push(1);
    stack.push(2);
    stack.push(3);
    System.out.println("Stack: " + stack);
    System.out.println("Top element: " + stack.peek());
    stack.pop();
    System.out.println("Stack: " + stack);


    System.out.println("Search 5: " + search(5, stack));
    System.out.println("Search 1: " + search(1, stack));
  }

  static String search(int val, Stack stack){
    if(stack.search(val) == -1){
      return "Not Found";
    }else{
      return "Found";
    }
  }
}