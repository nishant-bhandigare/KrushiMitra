// import 'package:agriplant/pages/map_page.dart';
// import 'package:agriplant/pages/market_place.dart';
// import 'package:agriplant/pages/orders_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
//
// class MainDrawer extends StatefulWidget {
//   MainDrawer({Key? key, required this.username, required this.email}) : super(key: key);
//
//   final String username;
//   final String email;
//
//   @override
//   State<MainDrawer> createState() => _MainDrawerState();
// }
//
// class _MainDrawerState extends State<MainDrawer> {
//   var currentPage = DrawerSections.dashboard;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Drawer(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               MyHeaderDrawer(),
//               MyDrawerList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget MyHeaderDrawer() {
//     return Container(
//       color: const Color.fromRGBO(142, 143, 253, 1),
//       width: double.infinity,
//       height: 200,
//       padding: const EdgeInsets.only(top: 20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(bottom: 10),
//             height: 70,
//             decoration: const BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                 image: AssetImage('assets/images/v1-pro-v2b.png'),
//               ),
//             ),
//           ),
//           const Text(
//             "Nishant Bhandigare",
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//           Text(
//             "nishant.211083101@vcet.edu.in",
//             style: TextStyle(
//               color: Colors.grey[200],
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget MyDrawerList() {
//     return Container(
//       padding: const EdgeInsets.only(top: 15),
//       child: Column(
//         children: [
//           menuItem(1, "Dashboard", IconlyLight.category, currentPage == DrawerSections.dashboard),
//           menuItem(2, "Settings", IconlyLight.setting, currentPage == DrawerSections.settings),
//           const Divider(),
//           menuItem(3, "Market Place", IconlyLight.bag, currentPage == DrawerSections.market_place),
//           menuItem(4, "Cart", IconlyLight.buy, currentPage == DrawerSections.orders_page),
//           menuItem(5, "Nearby", IconlyLight.location, currentPage == DrawerSections.nearby),
//           const Divider(),
//           menuItem(6, "Sign Out", IconlyLight.logout, currentPage == DrawerSections.sign_out),
//         ],
//       ),
//     );
//   }
//
//   Widget menuItem(int id, String title, IconData icon, bool selected) {
//     return Material(
//       color: selected ? Colors.grey[300] : Colors.transparent,
//       child: InkWell(
//         onTap: () {
//           setState(() {
//             if (id == 1) {
//               Navigator.pop(context);
//             } else if (id == 2) {
//               Navigator.pop(context);
//               // Navigate to Settings
//             } else if (id == 3) {
//               Navigator.pop(context);
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MarketPlace()));
//             } else if (id == 4) {
//               Navigator.pop(context);
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const OrdersPage()));
//             } else if (id == 5) {
//               Navigator.pop(context);
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MapPage()));
//             } else if (id == 6) {
//               // Sign Out logic
//             }
//           });
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Row(
//             children: [
//               Icon(
//                 icon,
//                 size: 25,
//                 color: Colors.black,
//               ),
//               const SizedBox(width: 10),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// enum DrawerSections {
//   dashboard,
//   settings,
//   market_place,
//   orders_page,
//   nearby,
//   sign_out,
// }

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
                  backgroundImage: AssetImage('assets/images/v1-pro-v2b.png'),
                ),
                SizedBox(height: 10),
                Text(
                  "Nishant Bhandigare",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "nishant.211083101@vcet.edu.in",
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

