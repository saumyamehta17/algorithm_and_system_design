// Priority Queue are used when objects are supposed to be processed based on some priority. Though Queue follows FIFO,
// sometimes queue elements to be processed according to the priority. Priority Queue is based on priority heap.

import java.util.*;

class PriorityQueueExample{
  public static void main(String args[]){
    PriorityQueue<Integer> pq = new PriorityQueue<>();
    pq.add(10);
    pq.add(5);
    pq.add(20);

    System.out.println("Queue: " + pq.peek());
    System.out.println("Queue: " + pq.poll()); // return null if que is empty
    System.out.println("Queue: " + pq.remove()); // raise exception if que is empty
    System.out.println("Queue: " + pq.peek());
  }
}

// Default ordering can ve overridden by comparator at queue construction time.
class Cell{
  int x, int y, int distance;

  Cell(int x, int y, int distance){
    this.x = x;
    this.y = y;
    this.distance = distance;
  }
}

// Custom Comparator
class DistanceComparator implements Comparator<Cell>{
  int compare(Cell a, Cell b){
    if(a.distance > b.distance){
      return 1;
    }else if(a.distance < b.distance){
      return -1
    }else{
      return 0;
    }
  }
}

import java.util.*;

class PriorityQueueCustomExample{
  PriorityQueue<Cell> pq = new PriorityQueue<Cell>(new DistanceComparator());

}