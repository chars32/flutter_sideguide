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

// getProducts service RETURN a List<Products> that we get from
// our firestore collection "products"
  Stream<List<Product>> getProducts() {
    return firestore
        .collection("products")
        // snapshots function notifies of results from a collection.
        // everytime there is a change in the collection
        // we can detected using snapshots
        .snapshots()
        // to avoid error Stream<QuerySnapshot<Map<String, dynamic>>>
        // which is definitely not a List<Product> like we declare in our function
        // What we can do is try to loop through all the snapshots inside this collection using the .map function
        // and loop through all the documents contained in the snapshots using the .map function
        // Once we are at the document level we can use doc.data() to get the document’s
        // data and then we use our Product.fromMap.
        // The last thing to do is to convert the mapping into an actual List using the .toList() method.
        .map((snapshot) => snapshot.docs.map((doc) {
              final d = doc.data();
              return Product.fromMap(d);
            }).toList());
  }
}
