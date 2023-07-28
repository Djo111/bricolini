import 'package:bricoloni_v2/scenes/upload_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
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
  String region = '';
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
        backgroundColor: Colors.blue,
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
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Submit your offer!',
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                  const SizedBox(height: 20),
                  DropdownButton<String>(
                    value: garbageType,
                    items: const [
                      DropdownMenuItem(
                        value: "garbage type",
                        child: Text("garbage type", textAlign: TextAlign.center),
                      ),
                      DropdownMenuItem(
                        value: "iron waste",
                        child: Text("Metal", textAlign: TextAlign.center),
                      ),
                      DropdownMenuItem(
                        value: "wood waste",
                        child: Text("Wood", textAlign: TextAlign.center),
                      ),
                      DropdownMenuItem(
                        value: "construction waste",
                        child: Text("Construction waste", textAlign: TextAlign.center),
                      ),
                      DropdownMenuItem(
                        value: "others",
                        child: Text("Other", textAlign: TextAlign.center),
                      )
                    ],
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    dropdownColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        garbageType = value as String;
                      });
                    },
                  ),
                  const SizedBox(height: 55, width: 5), //saut de ligne
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
                        onTap: (tapPosition, latLngPosition) async {
                          print('Region: $region');
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
                    region = _controller.text;
                  },
                  icon: Icon(Icons.edit_note_rounded),
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
                backgroundColor: Colors.blue, // Set the background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 15.0), // Set the padding
              ),
              onPressed: () {
                print("offeradding : ${widget.id}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UploadImage(
                            title: "Upload a photo of your garbage",
                            garbageType: garbageType,
                            location: currentLocation.toString(),
                            id: widget.id,
                            region: region,
                          )),
                );
              },
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white, fontSize: 20),
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
