import 'package:ecommerce_flutter/app/auth_widget.dart';
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
        primarySwatch: Colors.blue,
      ),
      // Let's call the AuthWidget and provide the 2 builders with 2 different screens.
      // signedInBuilder, nonSignedInBuilder
      home: AuthWidget(
        signedInBuilder: (context) => const Scaffold(
          body: Center(child: Text("signed in")),
        ),
        nonSignedInBuilder: (context) => const Scaffold(
          body: Center(child: Text("NOT signed in")),
        ),
      ),
    );
  }
}
