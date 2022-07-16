import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_flutter/models/product.dart';
import 'package:ecommerce_flutter/models/user_data.dart';

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
    // The problem is that we never save this id inside a product, so when we retrieve it,
    // we don’t have the id (path id), to be able to easily delete it.
    final docId = firestore.collection("products").doc().id;
    await firestore.collection("products").doc(docId).set(product.toMap(docId));
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

  // To delete a Product from our collection is as simple as getting the collection,
  // getting the document via an id, and deleting it like below.
  Future<void> deleteProduct(String id) async {
    return await firestore.collection("products").doc(id).delete();
  }

  // save the user, on its own user's collection
  Future<void> addUser(
    UserData user,
  ) async {
    await firestore.collection("users").doc(user.uid).set(user.toMap());
  }

  // To get the user is a bit more complex as we have to check if the user exists first
  Future<UserData?> getUser(String uid) async {
    final doc = await firestore.collection("users").doc(uid).get();
    return doc.exists ? UserData.fromMap(doc.data()!) : null;
  }
}
