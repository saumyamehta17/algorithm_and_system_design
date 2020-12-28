// Priority Queue are used when objecta are supposed to be processed based on some priority. Though Queue follows FIFO,
// sometimes queue elements to be processed according to the priority. Priority Queue is based on priority heap.

import java.util.*;

class PriorityQueueExample{
  public static void main(String args[]){
    PriorityQueue<Integer> pq = new PriorityQueue<>();
    pq.add(10);
    pq.add(5);
    pq.add(20);

    System.out.println("Queue: " + pq.peek());
    System.out.println("Queue: " + pq.poll());
    System.out.println("Queue: " + pq.peek());
  }
}

// Default ordering can ve overridden by comparator at queue construction time.