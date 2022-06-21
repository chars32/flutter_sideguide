// bool isEven(int number) {
//   if (number % 2 == 0) {
//     return true;
//   }
//   return false;
// }

// Shorthand syntax
bool isEven(int number) => number % 2 == 0 ? true : false;

void main() {
  bool isNumberEven = isEven(4);
  print(isNumberEven);
}
