import 'package:flutter/material.dart';

class TransporterProfilePage extends StatefulWidget {
  const TransporterProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransporterProfilePageState createState() => _TransporterProfilePageState();
}

class _TransporterProfilePageState extends State<TransporterProfilePage> {
  String name = 'John Doe';
  String email = 'johndoe@example.com';
  String phone = '+1 123-456-7890';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Email: $email',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Phone: $phone',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
