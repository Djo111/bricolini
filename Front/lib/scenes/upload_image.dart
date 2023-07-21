import 'package:bricoloni_v2/scenes/simple_user_offers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'image_upload_widget.dart';
import 'image_verification.dart';

class ImageUploadWidget extends StatefulWidget {
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
              : Center(
            child: Icon(
              Icons.image,
              size: 50,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 16),
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
              child: Text('Choose from Gallery'),
            ),
            SizedBox(width: 16),
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
              child: Text('Take a Photo'),
            ),
          ],
        ),
      ],
    );
  }
}

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  ImageUploadWidget uploader = ImageUploadWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Submit your Offer!"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
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
                uploader,
              ],
            ),
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
                  MaterialPageRoute(builder: (context) => ImageVerificationPage()),
                );
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