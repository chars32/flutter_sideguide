import 'package:ecommerce_flutter/app/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// AuthWidget is going to be responsible for building the correct UIs depending on the auth state.
// It is a key widget when building authentication systems.
class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key? key,
    required this.signedInBuilder,
    required this.nonSignedInBuilder,
    required this.adminSignedInBuilder,
  }) : super(key: key);
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;
  final WidgetBuilder adminSignedInBuilder;

  final adminEmail = "admin@admin.com";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // we want to listen to the authState changes so we will reference our provider
    final authStateChanges = ref.watch(authStateChangesProvider);
    const adminEmail = "admin@admin.com";

    // .when builder a main feature of riverpod
    // We will call authStateChanges.when to listen for changes in the User that is logged in or not.
    // The .when function provides us with 3 callbacks: data, loading, and error.
    return authStateChanges.when(
      data: (user) => user != null
          // ternary operator if user.email is equal to the adminEmail or not
          ? user.email == adminEmail
              ? adminSignedInBuilder(context)
              : signedInBuilder(context)
          : nonSignedInBuilder(context),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const Scaffold(
          body: Center(
        child: Text("Something went wrong!"),
      )),
    );
  }
}
