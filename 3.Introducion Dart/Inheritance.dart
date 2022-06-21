class Person {
  void showName(String name) {
    print(name);
  }

  void showEmail(String email) {
    print(email);
  }

  Person(); // constructor
}

// Inheritance
class Bob extends Person {
  // Override methods of a inheritance class
  @override
  void showEmail(String email) {
    print("Bob's email: $email");
  }

  // Adding new method
  void showAge(int age) {
    // Refering to a superclass using super(aka parent class)
    super.showName("Chars");

    print(age.toString());
  }
}

void main() {
  Bob bob = Bob();
  bob.showName("Bob"); // Bob
  bob.showEmail("Bob@bob.com"); // Bob@bob.com
  bob.showAge(15); // 15
}
