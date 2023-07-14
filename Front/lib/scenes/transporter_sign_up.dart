import 'package:bricoloni_v2/scenes/transporter_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class Transporter_Sign_Up extends StatefulWidget {
  final String email;
  final String fullName;
  final String password;
  final String phoneNumber;

  const Transporter_Sign_Up({
    Key? key,
    required this.email,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _Transporter_Sign_UpState createState() => _Transporter_Sign_UpState();
}

class _Transporter_Sign_UpState extends State<Transporter_Sign_Up> {
  final TextEditingController _regionController = TextEditingController();
  double _numTrucksType1 = 0.0;
  double _numTrucksType2 = 0.0;
  double _numTrucksType3 = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transporter'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _regionController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Text(
                  'Number Of Small Trucks: ${_numTrucksType1.toInt()}',
                  style: const TextStyle(fontSize: 16),
                ),
                SpinBox(
                  min: 0,
                  max: 100,
                  value: 0,
                  onChanged: (value) {
                    setState(() {
                      _numTrucksType1 = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Text(
                  'Number Of Median Trucks: ${_numTrucksType2.toInt()}',
                  style: const TextStyle(fontSize: 16),
                ),
                SpinBox(
                  min: 0,
                  max: 100,
                  value: 0,
                  onChanged: (value) {
                    setState(() {
                      _numTrucksType2 = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Text(
                  'Number Of Big Trucks: ${_numTrucksType3.toInt()}',
                  style: const TextStyle(fontSize: 16),
                ),
                SpinBox(
                  min: 0,
                  max: 100,
                  value: 0,
                  onChanged: (value) {
                    setState(() {
                      _numTrucksType3 = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String region = _regionController.text;
                int numSmallTrucks = _numTrucksType1.toInt();
                int numMedianTrucks = _numTrucksType2.toInt();
                int numBigTrucks = _numTrucksType3.toInt();

                // TODO: Perform signup action with the entered data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Transporter_HomeScreen()),
                );
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
