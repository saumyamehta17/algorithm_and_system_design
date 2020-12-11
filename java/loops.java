// While Loop
class WhileLoop{
    public static void main(String args[]){
        int x = 1;
        while(x <= 4){
            System.out.println(x);
            x ++;
        }
    }
}

// For Loop
public static void main(String args[]){
    for(int x = 0; x <= 4; x++){
        System.out.println("Value of x is "+ x);
    }
}

// For each Loop
public static void main(String args[]){
    String names[] = {"Marry", "Saumya", "Alex"};
    for(String x:names){
        System.out.println("Name: "+x);
    }
}

// Do While Loop
public static void main(String args[]){
    int x = 3;
    do{
        System.out.println(x);
        x ++;
    }while(x < 3);
}

// iterate over chars in word
string word = "London";
String[] word_arr = word.split("");
for(String ch:word_arr){
  System.out.println("chr: "+ ch);
}