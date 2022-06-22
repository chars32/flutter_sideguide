enum Languages { dart, java, python }

void main() {
  var lenguage = Languages.java;

  print(Languages.java.index);

  List<Languages> languages = Languages.values;
  print(languages);

  switch (lenguage) {
    case Languages.dart:
      print('You select dart');
      break;
    case Languages.java:
      print('You select java');
      break;
    case Languages.python:
      print('You select python');
      break;
  }
}
