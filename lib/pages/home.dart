import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
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
        title: const Column(
          children: [
            kMiniHeight,
            Text(
              "Location",
              style: kNormalTextStyle,
            ),
            Text(
              "Dar es Salaam, TZ",
              style: kHeaderTextStyle,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.shopping_cart_checkout),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: ListView(children: [
        Text("Rest"),
      ]),
    );
  }
}
