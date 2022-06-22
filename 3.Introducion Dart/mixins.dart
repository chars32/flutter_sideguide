// Mixins
mixin Happy {
  void happyFace() => print(":)");
}

mixin Sad {
  void sadFace() => print(":(");
}

mixin Frustrated {
  void frustratedFace() => print(":/");
}

// To attach mixins to the User use the keyword with
// and separate by comas
class User with Happy, Sad, Frustrated {
  final String name; // using keyword final as name is immutable
  User({required this.name});
}

void main() {
  final user = User(name: "Bob");
  user.happyFace(); //  :)
  user.sadFace(); //  :(
  user.frustratedFace(); //  :/
}
