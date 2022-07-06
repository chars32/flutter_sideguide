//  Bonus: Creating an extension
// “extend” a type and create different methods for it

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
