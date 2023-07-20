import 'package:bricoloni_v2/scenes/upload_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class SimpleUserOffersAdding extends StatefulWidget {
  final String id;
  SimpleUserOffersAdding({Key? key, required this.title, required this.id})
      : super(key: key);

  final String title;

  @override
  _SimpleUserOffersAdding createState() => _SimpleUserOffersAdding();
}

class _SimpleUserOffersAdding extends State<SimpleUserOffersAdding> {
  String garbageType = "garbage type";
  LatLng currentLocation = LatLng(36, 10);
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the arrow is pressed
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Submit your offer!',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    value: garbageType,
                    items: const [
                      DropdownMenuItem(
                        value: "garbage type",
                        child: Text("garbage type"),
                      ),
                      DropdownMenuItem(
                        value: "metal",
                        child: Text("Metal"),
                      ),
                      DropdownMenuItem(
                        value: "wood",
                        child: Text("Wood"),
                      ),
                      DropdownMenuItem(
                        value: "constructionWaste",
                        child: Text("Construction waste"),
                      ),
                      DropdownMenuItem(
                        value: "other",
                        child: Text("Other"),
                      )
                    ],
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    dropdownColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        garbageType = value as String;
                      });
                    },
                  ),
                  const SizedBox(height: 55), //saut de ligne
                  const Text(
                    'Choose garbage location',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Expanded(
                    child: FlutterMap(
                      options: MapOptions(
                        minZoom: 10.0,
                        center: currentLocation,
                        interactiveFlags: InteractiveFlag
                            .all, // enables all interaction options
                        onTap: (tapPosition, latLngPosition) {
                          setState(() {
                            currentLocation = latLngPosition;
                          });
                        },
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 45.0,
                              height: 45.0,
                              point: currentLocation,
                              builder: (context) => IconButton(
                                icon: Icon(Icons.location_on),
                                onPressed: () {
                                  if (kDebugMode) {
                                    print('Marker tapped!');
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter address',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () async {
                    List<Location> locations =
                        await locationFromAddress(_controller.text);
                    setState(() {
                      currentLocation = LatLng(
                          locations.first.latitude, locations.first.longitude);
                    });
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10), //saut de ligne
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.lightGreen, // Set the background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 15.0), // Set the padding
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UploadImage(
                            id: widget.id,
                            title: "Upload a photo of your garbage",
                            garbageType: garbageType,
                            location: currentLocation.toString(),
                          )),
                );
              },
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _determinePosition() async {
    Position position = await Geolocator.getCurrentPosition();

    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });
  }
}
