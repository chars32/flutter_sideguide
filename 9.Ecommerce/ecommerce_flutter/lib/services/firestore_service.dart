import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/models/product.dart';

// class that will initialize the firestore instance,
// and manipulate data coming from/to the database.
class FirestoreService {
  // uid is used to define our user inside Firebase
  FirestoreService({required this.uid});
  final String uid;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // addProduct service function that will be responsible
  // to save a Product inside our cloud database
  Future<void> addProduct(
    Product product,
  ) async {
    await firestore
        .collection("products")
        .add(product.toMap())
        .then((value) => print(value))
        .catchError((onError) => print("Error"));
  }
}
