import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Welcome back 👋",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            Text(
              "Chars's Portfolio",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.asset(
            'assets/images/me_avatar.png',
            height: 45,
          ),
        ),
      ],
    );
  }
}
