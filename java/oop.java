// Create a Class and should be Car.java file
public class Car{
  int wheels = 4;
}

// Create an Object
Car obj = new Car();
System.out.println(obj.wheels);

// Understanding public static void main
class MyClass{
  public static void main(String[] args){
    System.out.println("Hello I am called by JVM");
  }
}
// public, is a access identifier and its made public so that JVM can call it from outside of this class
// static, is a keyword and JVM can call it without creating object from it as its class method
// void, which method will not return anything
// main, is method name which JVM will look for. This is where main execution take place.
// String[] args, is array of arguments which user can pass while execution file. can have different name also
    // Strings[] params -> java MyClass.java 'Saum'
class Main {
  public static void main(int args[]) {
    for(int arg:args){
      System.out.println(arg);
    }
  }
}   // java Main 1 2 3

// Interfaces
interface Food{
 public void taste(); // No Body
}
// can not make object of interface

class IndianFood implements Food{
    public void taste(){
     System.out.println("Indian Food is exotic");
    }
}
IndianFood food = new IndianFood();
food.taste();
