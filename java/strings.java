// in Java, string is an object that represents seq of characters

// string creation:
// Using string literal(this style makes more memory efficient, as it does not create new object if already exists)

String greeting = "Hello";

// Using new keyword(this approach will create 2 objects and 1 reference variable)
// string literal, string object and s as variable
String s = new String("Welcome");

// For mutable string use class StringBuffer and StringBuilder
// For immutable, class is String

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
