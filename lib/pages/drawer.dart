import 'package:agriplant/pages/map_page.dart';
import 'package:agriplant/pages/market_place.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'cart_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, required this.username, required this.email}) : super(key: key);

  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(142, 143, 253, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 35,
                ),
                SizedBox(height: 10),
                Text(
                  "Nishant Bhandigare",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  "nishant@example.com",
                  style: TextStyle( fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(IconlyLight.category),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Dashboard
            },
          ),
          ListTile(
            leading: const Icon(IconlyLight.setting),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Settings
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(IconlyLight.bag),
            title: const Text('Market Place'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Market Place
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MarketPlace()),
              );
            },
          ),
          ListTile(
            leading: const Icon(IconlyLight.buy),
            title: const Text('Cart'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Cart
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CartPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(IconlyLight.location),
            title: const Text('Nearby'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Nearby
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MapPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(IconlyLight.logout),
            title: const Text('Sign Out'),
            onTap: () {
              // Sign Out logic
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}

