import 'package:bricoloni_v2/scenes/upload_image.dart';
import 'package:flutter/material.dart';

class SimpleUserOffersAdding extends StatefulWidget {
  const SimpleUserOffersAdding({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  _SimpleUserOffersAdding createState() => _SimpleUserOffersAdding();
}

class _SimpleUserOffersAdding extends State<SimpleUserOffersAdding> {
  String _garbageType = "garbage type";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigator.pop(context); // Navigate back when the arrow is pressed
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Submit your offer!',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),

                DropdownButton<String>(
                  value: _garbageType,
                  items: const [
                    DropdownMenuItem(
                      child: Text("garbage type"),
                      value: "garbage type",
                    ),
                    DropdownMenuItem(
                      child: Text("Metal"),
                      value: "metal",
                    ),
                    DropdownMenuItem(
                      child: Text("Wood"),
                      value: "wood",
                    ),
                    DropdownMenuItem(
                      child: Text("Construction waste"),
                      value: "constructionWaste",
                    ),
                    DropdownMenuItem(
                      child: Text("Other"),
                      value: "other",
                    )
                  ],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  dropdownColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      _garbageType = value as String;
                    });
                  },
                )
                ,

                SizedBox(height: 70), //saut de ligne
                Text(
                  'Choose garbage location',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(alignment: Alignment.center, child: Text("")),
          ),
          SizedBox(height: 10), //saut de ligne

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
                      builder: (context) =>
                          UploadImage(title: "Upload a photo of your garbage")),
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
      backgroundColor: Colors.black,
    );
  }
}
