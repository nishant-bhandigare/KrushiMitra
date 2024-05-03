import 'package:agriplant/pages/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                foregroundImage: NetworkImage(
                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vecteezy.com%2Ffree-vector%2Fuser-icon&psig=AOvVaw0SelyGukoK8-S7okTxjsV1&ust=1714737411939000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMjHu-X07oUDFQAAAAAdAAAAABAE'),
              ),
            ),
          ),
          Center(
            child: Text(
              "Nishant Bhandigare",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Center(
            child: Text(
              "nishant@example.com",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text("My orders"),
            leading: const Icon(IconlyLight.bag),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersPage(),
                  ));
            },
          ),
          ListTile(
            title: const Text("About us"),
            leading: const Icon(IconlyLight.infoSquare),
            onTap: () {},
          ),
        ],
      );
  }
}
