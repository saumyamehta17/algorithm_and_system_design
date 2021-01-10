// in Java, string is an object that represents seq of characters

// string creation:
// Using string literal(this style makes more memory efficient, as it does not create new object if already exists)

String greeting = "Hello";

// Using new keyword(this approach will create 2 objects and 1 reference variable)
// string literal, string object and s as variable
String s = new String("Welcome");

// For mutable string use class StringBuffer and StringBuilder
// For immutable, class is String
// When to used which one
- When string remain constant through out the program, use String class object
- When string can change and will be accessed by single-thread, use StringBuilder class object
- When string can change and will be accessed by multiple-threads, use StringBuffer class object
class StringExample{
  public static void concat(String str){
    str.concat(" Java");
  }

  public static void concatStringBuilder(StringBuilder str){
    str.append(" Java");
  }

  public static void concatStringBuffer(StringBuffer str){
    str.append(" Java");
  }

  public static void main(String[] args){
    String s1 = new String("Hello");
    concat(s1);
    System.out.println("String: "+ s1); // Hello, because its immutable

    StringBuilder s2 = new StringBuilder("Hello");
    concatStringBuilder(s2);
    System.out.println("StringBuilder: "+ s2); // Hello Java, because its mutable

    StringBuffer s3 = new StringBuffer("Hello");
    concatStringBuffer(s3);
    System.out.println("StringBuffer: "+ s3); // Hello Java, because its mutable
  }
}

// Methods
greeting.length();
greeting.toLowerCase();
greeting.toUpperCase();
greeting.indexOf("H");
greeting.toCharArray(); // converts string to char of array ["H", "e", "l", "l", "o"]
String firstname = "Saumya";
String lastname = "M";
System.out.println(firstname + " " + lastname)
firstname.concat(lastname);
// More String Methods -> https://www.w3schools.com/java/java_ref_string.asp

// iterate over string
for(int i = 0; i < s.length; i++){
  System.out.println(s.charAt(i));
}

// replace char at specific pos
myString.setCharAt(i, ch);

// comparision
string1 == string2; // compare address
string1.equals(string2); // compare content