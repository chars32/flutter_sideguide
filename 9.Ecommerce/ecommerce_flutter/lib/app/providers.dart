import 'package:ecommerce_flutter/services/firestore_service.dart';
import 'package:ecommerce_flutter/services/storage_servide.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//1. Provide us with the FirebaseAuth.instance which is used to perform Authentication operations.
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

//2. Will provide us with authentication changes that happen through our app.
final authStateChangesProvider = StreamProvider<User?>(
  (ref) {
    return ref.watch(firebaseAuthProvider).authStateChanges();
  },
);

// 3. Provider that verify that the user is loged in.
// It dependes of authStateChangeProvider because we
// dont want users that are not logged in can read or write
// into the database.
final databaseProvider = Provider<FirestoreService?>((ref) {
  final auth = ref.watch(authStateChangesProvider);

  String? uid = auth.asData?.value?.uid;

  if (uid != null) {
    return FirestoreService(uid: uid);
  }
  return null;
});

// 4. Provider that verify that the user is loged in.
final storageProvider = Provider<StorageService?>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  String? uid = auth.asData?.value?.uid;
  if (uid != null) {
    return StorageService(uid: uid);
  }
  return null;
});
