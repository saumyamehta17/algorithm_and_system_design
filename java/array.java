// Array of integers

int[] nums = {2,3,1,19};
// loop through an array
for(int i = 0; i < nums.length; i++){
  System.out.println('value of i '+ i);
}

// Array of strings
Strings[] names = {'Alex', 'Alexa'};
for(int i:names){
  System.out.println('name '+ names[i]);
}

// Multidimensional Array
int[][] nums = { {1,2,3}, {5,6,7} };
for(int i = 0; i < nums.length; i++){
    for(int j = 0; j < nums[i].length; j++){
        System.out.println("num is "+ nums[i][j]);
    }
}

int[][] nums = new int[4][5]
