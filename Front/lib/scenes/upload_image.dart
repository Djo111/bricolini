import 'package:bricoloni_v2/scenes/simple_user_offers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ImageUploadWidget extends StatefulWidget {
  const ImageUploadWidget({super.key});

  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  String? _image;
  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = pickedFile.path; //_image = File(pickedFile.path)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(10),
          ),
          child: _image != null
              ? Image.network(
                  //on peut travailler avec Image.file mais _image doit etre un File et pas String .
                  _image!,
                  fit: BoxFit.cover,
                )
              : const Center(
                  child: Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.grey, // Set the background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 15.0), // Set the padding
              ),
              onPressed: () {
                getImage(ImageSource.gallery);
              },
              child: const Text('Choose from Gallery'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                backgroundColor: Colors.grey, // Set the background color
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 15.0), // Set the padding
              ),
              onPressed: () {
                getImage(ImageSource.camera);
              },
              child: const Text('Take a Photo'),
            ),
          ],
        ),
      ],
    );
  }
}

class UploadImage extends StatefulWidget {
  final String title;
  final String garbageType;
  final String location;
  final String id;

  const UploadImage({
    Key? key,
    required this.title,
    required this.garbageType,
    required this.location,
    required this.id,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  Future<void> createOffer(String s1, String s2) async {
    try {
      final response = await http
          .post(Uri.parse('http://localhost:3000/simple-user/offers'), body: {
        "id_offerProvider": s1,
        "location": s2,
        "img": "lib/images/construct.jpg"
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (kDebugMode) {
          print('Offer created: ${response.body}');
        }
      } else {
        if (kDebugMode) {
          print('Failed to create offer: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception occurred: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Submit your Offer!"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upload a photo of your garbage!',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(height: 10), //saut de ligne
                Text(
                  'Regulations require you to upload a photo of your garbage...',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                SizedBox(height: 40),
                ImageUploadWidget(),
              ],
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
                print("offeverify : ${widget.id}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SimpleUserOffers(id: widget.id)),
                );
                print(widget.id);
                createOffer(widget.id, widget.location);
              },
              child: const Text(
                'Verify',
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
