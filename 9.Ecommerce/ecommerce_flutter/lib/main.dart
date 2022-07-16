import 'package:ecommerce_flutter/app/auth_widget.dart';
import 'package:ecommerce_flutter/app/providers.dart';
import 'package:ecommerce_flutter/firebase_options.dart';
import 'package:ecommerce_flutter/pages/admin/admin_home.dart';
import 'package:ecommerce_flutter/pages/auth/sign_in_page.dart';
import 'package:ecommerce_flutter/pages/user/user_home.dart';
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
        // Use AuthWidget to verify type of user.
        adminSignedInBuilder: (context) => const AdminHome(),
        // adminSignedInBuilder is a ConsumerWidget that brings
        // AdminHome widget with an  AppBar structure if the user
        // is loged with the admin count admin@admin.com
        signedInBuilder: (context) => const UserHome(),
        // SignedInBuilder when logs goes directly to UserHome
        nonSignedInBuilder: (_) => const SignInPage(),
        // Call SignInPage widget when the user is not logged in
      ),
    );
  }
}
