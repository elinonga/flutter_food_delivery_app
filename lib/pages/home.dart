import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> isSelectedList = [];

  @override
  void initState() {
    super.initState();
    isSelectedList = List.generate(7, (index) => false);
  }

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
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.shopping_cart_checkout),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: ListView(children: [
        kNormalHeight,

        //  Image Banner
        const ImageGreetingContainer(),
        kMidHeight,

        // Row of Categories Container
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              7,
              (index) => TextCircularContainer(
                lebo: "Category $index",
                isSelected: isSelectedList[index],
                onTap: () {
                  setState(() {
                    isSelectedList = List.generate(7, (i) => i == index);
                  });
                },
              ),
            ),
          ),
        ),
        kMidHeight,

        // Row of Food Containers
        const FoodContainer(),
      ]),
    );
  }
}

class FoodContainer extends StatelessWidget {
  const FoodContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      decoration: const BoxDecoration(
        color: Colors.black,
        image: const DecorationImage(
          image: kJunkFoodImage,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Junk Food ListTile
            Container(
              margin: EdgeInsets.only(top: 12.0, left: 12.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(
                    50.0), // Set the radius to half the width
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: ListTile(
                  leading: Icon(
                    Icons.fastfood,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Junk Food",
                    style: kMidNormalTextStyle,
                  ),
                ),
              ),
            ),

            // Column of Food
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, 2),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Arabian beef Kebab",
                      style: kBigWhiteTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "30 Min | 1 serving",
                          style: kMidNormalTextStyle,
                        ),
                        Container(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.grey,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    kLilHeight,
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}

class TextCircularContainer extends StatelessWidget {
  final String lebo;
  final bool isSelected;
  final VoidCallback onTap;

  const TextCircularContainer({
    Key? key,
    required this.lebo,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          left: 15.0,
          right: 8.0,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : Colors.grey,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            lebo,
            style: kWhiteTextStyle,
          ),
        ),
      ),
    );
  }
}

class ImageGreetingContainer extends StatelessWidget {
  const ImageGreetingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18.0),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.black,
          image: const DecorationImage(
            image: kImageBanner,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ),
          ]),
      child: Container(
        margin: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(0, 2),
                blurRadius: 12.0,
                spreadRadius: 6.0,
              ),
            ]),
        child: const Padding(
          padding: EdgeInsets.only(left: 18.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, David!",
                style: kHeaderTextStyle,
              ),
              Text(
                "You've 23 discount tickets!",
                style: kNormalTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
