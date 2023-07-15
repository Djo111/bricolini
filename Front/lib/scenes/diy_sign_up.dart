import 'package:flutter/material.dart';

class DIY_Sign_Up extends StatefulWidget {
  final String email;
  final String fullName;
  final String password;
  final String phoneNumber;

  const DIY_Sign_Up({
    Key? key,
    required this.email,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DIY_Sign_UpState createState() => _DIY_Sign_UpState();
}

class _DIY_Sign_UpState extends State<DIY_Sign_Up> {
  final TextEditingController _addressController = TextEditingController();
  int? _selectedItemIndex; // Track the index of the selected item
  String Type_Waste = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DIY_Workshop'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Checklist',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            buildCheckboxListTile(0, 'WoodWaste'),
            buildCheckboxListTile(1, 'MetalWaste'),
            buildCheckboxListTile(2, 'ConstructionWaste'),
            buildCheckboxListTile(3, 'Other'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String address = _addressController.text;
                List<bool> checklist = List<bool>.filled(4, false);
                if (_selectedItemIndex != null) {
                  checklist[_selectedItemIndex!] = true;
                }
                int trueIndex =
                    checklist.indexWhere((element) => element == true);
                switch (trueIndex) {
                  case 0:
                    Type_Waste = "WoodWaste";
                    break;
                  case 1:
                    Type_Waste = "MetalWaste";
                    break;
                  case 2:
                    Type_Waste = "ConstructionWaste";
                    break;
                  case 3:
                    Type_Waste = "Other";
                    break;
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  CheckboxListTile buildCheckboxListTile(int index, String title) {
    return CheckboxListTile(
      title: Text(title),
      value: _selectedItemIndex == index, // Check if the item is selected
      onChanged: (value) {
        setState(() {
          if (value!) {
            _selectedItemIndex = index; // Update the selected item index
          } else {
            _selectedItemIndex = null; // Deselect the item if unchecked
          }
        });
      },
      secondary: _selectedItemIndex == index
          ? const Icon(Icons.check, color: Colors.green)
          : null,
    );
  }
}
