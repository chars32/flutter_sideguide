import 'package:ecommerce_flutter/app/auth_widget.dart';
import 'package:ecommerce_flutter/app/pages/admin/admin_home.dart';
import 'package:ecommerce_flutter/app/pages/auth/sign_in_page.dart';
import 'package:ecommerce_flutter/app/providers.dart';
import 'package:ecommerce_flutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Change colors in ThemeData
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.orange,
          seedColor: Colors.orange,
        ),
      ),
      home: AuthWidget(
        // adminSignedInBuilder is a ConsumerWidget that brings
        // awidget with an  AppBar structurem if the user is loged
        // with the admin count admin@admin.com
        adminSignedInBuilder: (context) => const AdminHome(),
        signedInBuilder: (context) => Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("signed in"),
                // let’s add a sign-out button that simply calls the signOut() function of our firebase auth provider.
                ElevatedButton(
                  onPressed: () {
                    ref.read(firebaseAuthProvider).signOut();
                  },
                  child: const Center(
                    child: Text(
                      "Sign out",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        // Call SignInPage widget when the user is not logged in
        nonSignedInBuilder: (_) => const SignInPage(),
      ),
    );
  }
}
