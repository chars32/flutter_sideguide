import 'package:ecommerce_flutter/app/pages/admin/admin_add_product.dart';
import 'package:ecommerce_flutter/app/providers.dart';
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
    );
  }
}
