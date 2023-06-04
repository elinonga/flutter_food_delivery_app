import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("Location"),
            Text("Dar es Salaam, TZ"),
          ],
        ),
        actions: [Icon(Icons.shopping_cart_checkout)],
      ),
      drawer: const MainDrawer(),
      body: ListView(children: [
        Text("Rest"),
      ]),
    );
  }
}
