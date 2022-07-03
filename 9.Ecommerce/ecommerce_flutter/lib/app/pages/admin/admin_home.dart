import 'package:ecommerce_flutter/app/pages/admin/admin_add_product.dart';
import 'package:ecommerce_flutter/app/providers.dart';
import 'package:ecommerce_flutter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      // FloatingActionButton to redirect to AdminAddProductPage widget
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AdminAddProductPage())),
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Admin Home',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => ref.read(firebaseAuthProvider).signOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      // A StreamBuilder is similar to a FutureBuilder were given a stream,
      // it builds widgets depending on the data coming in (if any).
      // Notice how we pass in a List<Product> as a type because we want to indicate what this builder is returning.
      body: StreamBuilder<List<Product>>(
        // To pass the stream we use the provider by calling
        // ref.read(databaseProvider)!.getProducts().
        // We are forcing the value here (!) because we are certain that the user exists.
        stream: ref.read(databaseProvider)!.getProducts(),
        // inside builder, we are provided with an additional parameter called snapshot.
        // We will use this snapshot to check if the data is not equal to null and
        // if we established a Connection with the stream
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.data != null) {
            // build our ListView using ListView.builder as we have done couple of times now.
            // We will use snapshot.data![index] to be able to get the Product
            //  from the snapshot that comes from the stream.
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ListTile(
                  title: Text(product.name),
                  // modify the ListTile that the products are populated with a trailing delete Icon.
                  // When we press the delete Icon we want to call the deleteProduct inside our
                  // FirestoreService that is defined as our databaseProvider.
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        ref.read(databaseProvider)!.deleteProduct(product.id!),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
