// 1) By default hash map is unsynchronized i.e multiple threads can access it simultaneously
// 2) default capacity is 16 i.e number of buckets hashMap can hold
// 3) default load factor is 0.75 i.e percent value of capacity to be increased. Meaning rehashing take place when 75% is filled
// 4) Threshold, 16*0.75 = 12 which mean rehashing take place after inserting 12 key-value pairs
// 5) Rehashing, process of doubling the capacity after it reaches the threshold. It go like 2^4, 2^5, ....

import java.util.HashMap;
import java.util.Map;

class HashMapExample{
  public static void main(String[] args)
  {
      HashMap<Integer, String> map = new HashMap<>();
//       HashMap<Character, Integer> map = new HashMap<>();
      // inserting
      map.put(1, "Bolsonaro");
      map.put(2, "Putin");
      map.put(3, "Frank Walter");

      System.out.println("Map iterating");
      // Iteration
      for(Map.Entry pair: map.entrySet()){
        System.out.println("Key: " + pair.getKey() + " Value: " + pair.getValue());
      }
      for(String president: map.values()){
        System.out.println(president);
      }
      for(Integer i : map.keySet()){
        System.out.println("Key: " + i + " Value: " + map.get(i));
      }

      // Remove
      map.remove(2);

      // contains key
      map.containsKey("Putin");
      // get value from map
      map.get("Putin");

      // Change values
      map.put(1, "Jair Bolsonaro");
  }
}