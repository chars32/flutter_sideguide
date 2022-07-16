class UserData {
  String email;
  String uid;

  UserData({
    required this.email,
    required this.uid,
  });
  // Getting email and uid
  UserData.fromMap(Map<String, dynamic> map)
      : email = map['email'] ?? "",
        uid = map['uid'] ?? "";
  // Return email and uis
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
    };
  }
}
