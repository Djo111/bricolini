import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'dart:io';
import 'image_verification.dart';
import 'dart:convert';

class ImageUploadWidget extends StatefulWidget {
  final Function(String) onImageSelect;

  ImageUploadWidget({Key? key, required this.onImageSelect}) : super(key: key);

  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  String? _image;
  final picker = ImagePicker();
  String _newImagePath = '';
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _image = pickedFile.path;
      const String path = "lib/images";
      final String fileName = basename(_image!);
      final File newImage = await File('$path/$fileName').create();
      await newImage.writeAsBytes(await File(_image!).readAsBytes());
      _newImagePath = '$path/$fileName';
      setState(() {
        widget.onImageSelect(_newImagePath);
      });
    }
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
          // ignore: unnecessary_null_comparison
          child: _newImagePath != null
              ? Image.file(
                  File(_newImagePath),
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
  final String region;

  const UploadImage({
    Key? key,
    required this.title,
    required this.garbageType,
    required this.location,
    required this.id,
    required this.region,
  }) : super(key: key);
  @override

  // ignore: library_private_types_in_public_api
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String path = '';

  void onImageSelect(String newPath) {
    setState(() {
      path = newPath;
    });
  }

  Future<String> offerverify(String path) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/offer/verify/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "imageUrl": path,
      }),
    );
    String s = response.body;
    print(s);
    return s;
  }

  Future<void> createOffer(
      String s1, String s2, String s3, String s4, String s5) async {
    try {
      final response = await http
          .post(Uri.parse('http://localhost:3000/simple-user/offers'), body: {
        "id_offerProvider": s1,
        "location": s2,
        "img": s3,
        "cordonnes": s4,
        "waste_type": s5
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
        backgroundColor: Colors.lightGreen,
        title: const Text("Submit your Offer!"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Upload a photo of your garbage!',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                const SizedBox(height: 10), //saut de ligne
                const Text(
                  'Regulations require you to upload a photo of your garbage...',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                const SizedBox(height: 40),
                ImageUploadWidget(onImageSelect: onImageSelect),
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
                if (kDebugMode) {
                  print("offeverify : ${widget.id}");
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ImageVerificationPage()),
                );
                print(widget.id);
                createOffer(widget.id, widget.region, path, widget.location,
                    widget.garbageType);
                offerverify(path);
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
