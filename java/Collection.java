// Queue
import java.util.Queue;
import java.util.LinkedList;

public class QueueExample{

  public static void main(String[] args){
    Queue<Integer> que = new LinkedList<>();
    que.add(1);
    que.add(2);
    que.add(9);

    System.out.println("Queue " +que);
  }
}