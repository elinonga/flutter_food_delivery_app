import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/widgets/main_drawer.dart';
import 'package:food_delivery_app/widgets/restaurants_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Location location;
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;

  List<bool> isSelectedList = [];

  @override
  void initState() {
    super.initState();
    isSelectedList = List.generate(7, (index) => false);
    location = Location();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // Location services are disabled or denied, handle accordingly
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        // Location permissions are denied, handle accordingly
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(
        () {}); // Trigger a rebuild to update the UI with the location data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
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
      body: ListView(
        children: [
          kNormalHeight,
          // Image Banner
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                FoodContainer(),
                FoodContainer(),
                FoodContainer(),
              ],
            ),
          ),

          // Map of restaurants near you
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                // Row of Near you Text + See map link
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Near You",
                      style: kHeaderTextStyle,
                    ),

                    // Seem map
                    GestureDetector(
                      onTap: () {
                        if (_locationData != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RestaurantMapLocation(
                                locationData: _locationData!,
                              ),
                            ),
                          );
                        } else {
                          // Handle the case where location data is not available
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Location Unavailable"),
                              content: const Text(
                                "Unable to fetch your current location.",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "See map",
                        style: kMidNormalTextStyle,
                      ),
                    ),
                  ],
                ),
                kMidHeight,

                // Dummy Map
                SizedBox(
                  height: 200,
                  child: GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(37.7749, -122.4194),
                      zoom: 12.0,
                    ),
                    markers: Set<Marker>.from([
                      const Marker(
                        markerId: MarkerId('dummyMarker'),
                        position: LatLng(37.7749, -122.4194),
                        infoWindow: InfoWindow(
                          title: 'Dummy Marker',
                          snippet: 'This is a dummy marker',
                        ),
                      ),
                    ]),
                  ),
                ),
                kMidHeight,
              ],
            ),
          ),
        ],
      ),
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
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 300,
      width: 250,
      decoration: const BoxDecoration(
        color: Colors.black,
        image: const DecorationImage(
          image: kJunkFoodImage,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Junk Food ListTile
            Container(
              margin: const EdgeInsets.only(top: 12.0, left: 12.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(
                    50.0), // Set the radius to half the width
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const ListTile(
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
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0, 2),
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
                    const SizedBox(
                      width: 120,
                      child: Text(
                        "Arabian beef Kebab",
                        style: kBigWhiteTextStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "30 Min | 1 serving",
                          style: kMidNormalTextStyle,
                        ),

                        // Favorite Icon
                        GestureDetector(
                          onTap: () {
                            // Handle the click event here
                            print('Favorite food!');
                          },
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: CircleBorder(
                                side: BorderSide(
                                  width: 6,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                              ),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 30,
                            ),
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
