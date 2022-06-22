abstract class Test {
  /// This is an abstract method because it has no body ({}).
  void testOne();

  /// This is NOT an abstract method because it has a body.
  void testTwo() {}

  // No constructor as well
}

// Using extends
// class UnitTest extends Test {
//   @override
//   void testOne() {
//     print('hello!');
//   }
// }

// Using implements - Interface
class UnitTest implements Test {
  @override
  void testOne() {
    print('hello one!');
  }

  @override
  void testTwo() {
    print('hello two!');
  }
}

void main() {
  UnitTest test = UnitTest();
  test.testOne(); // hello!
  test.testTwo(); // hello!
}
