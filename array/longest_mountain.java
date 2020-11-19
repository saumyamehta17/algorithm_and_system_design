import java.util.Arrays;
class Solution {
  int longestMountain = 0;
  public int longestMountain(int[] arr) {
    int i = 0;
    while(i < arr.length){

      int decr = 0;
      while(i+1 < arr.length && arr[i] < arr[i+1]){
        i ++;
        decr ++;
      }

      int incr = 0;
      if(decr > 0){
         while(i+1 < arr.length && arr[i] > arr[i+1]){
          i ++;
          incr ++;
         }
      }
      int curr_length = (incr+decr+1);
      if(curr_length > longestMountain && incr > 0){
        longestMountain = curr_length;
      }

      if(incr == 0){
          i++;
      }

    }

    return longestMountain;
  }
}

class LongestMountain{
  public static void main(String[] args){
    int[][] tests = {
      {2,1,4,7,3,2,5},
      {2,2,2},
      {0,1,2,3,4,5,6},
      {5,4,3,2,1,0},
      {3,3},
      {875,884,239,731,723,685},
      {2,1,4,7,3,25,5}
    };

    for(int i = 0; i < tests.length; i++){
       Solution sol = new Solution();
       System.out.println("Input: " + Arrays.toString(tests[i]));
       System.out.println("Output: " + sol.longestMountain(tests[i]));
    }
  }
}