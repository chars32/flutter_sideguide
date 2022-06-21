class User {
  // String? email;
  // String? name;
  String email;
  String name;

  //Constructor
  User({required this.email, required this.name});

  void printInfoUser (){
    print(email + " " + name);
  }
}

void main() {
  var user = User(email: 'algo@gmail.com', name: 'Chars');
  // var userEmail = user.email;
  // print(userEmail);
  user.printInfoUser();
}
