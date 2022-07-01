import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // instead of returning a Container(), let’s return a SignInScreen() provided by flutterfire_ui
    // and inside just add an EmailProviderConfiguration() to the providerConfigs
    return SignInScreen(
      providerConfigs: const [
        EmailProviderConfiguration(),
      ],
      // The SignInScreen inside SignInPage offers some parameters
      // so you can customize your sign in pages like a footer
      footerBuilder: (context, _) {
        return const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Center(
            child: Text(
              'By using in, you agree to our terms and conditions',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}
