import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterLogo(size: 80),
                Text('John Doe'),
                Text('johndoe@gmail.com'),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
            ),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
            ),
            title: const Text('Restaurants'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.access_time,
            ),
            title: const Text('Orders History'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
            ),
            title: const Text('Favorites'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.message,
            ),
            title: const Text('Chat'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
            ),
            title: const Text('Cart'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.category,
            ),
            title: const Text('Categories'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          const SizedBox(
            height: 100,
          ),
          ListTile(
            leading: Icon(
              Icons.support,
            ),
            title: Text('Support'),
            onTap: () {
              // Navigate to Support page
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text('Settings'),
            onTap: () {
              // Navigate to Settings page
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
            ),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
