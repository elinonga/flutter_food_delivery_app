import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      drawer: Drawer(
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
                Icons.restaurant,
              ),
              title: const Text('Restaurants'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
              ),
              title: const Text('Orders'),
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
              title: const Text('Messages'),
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
          ],
        ),
      ),
    );
  }
}
