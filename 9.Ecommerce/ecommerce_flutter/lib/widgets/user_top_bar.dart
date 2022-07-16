import 'package:ecommerce_flutter/app/pages/user/user_bag.dart';
import 'package:flutter/material.dart';

// Creating a UserTopBar
class UserTopBar extends StatelessWidget {
  final IconButton leaedingButton;
  const UserTopBar({Key? key, required this.leaedingButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leaedingButton,
        const Spacer(),
        IconButton(
          onPressed: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const UserOrders()));
          },
          icon: const Icon(Icons.menu),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserBag()));
          },
          icon: const Icon(Icons.shopping_bag),
        )
      ],
    );
  }
}
