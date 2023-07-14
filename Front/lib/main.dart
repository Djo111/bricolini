// ignore_for_file: camel_case_types, unnecessary_import, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bricolini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isRailVisible = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isRailVisible = false;
    });
  }

  void _onBackPressed() {
    setState(() {
      _isRailVisible = true;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const HistoryPage(),
    const MarketplacePage(),
    const StatsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onBackPressed();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bricolini'),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                );
              },
            ),
          ],
        ),
        body: Row(
          children: [
            if (_isRailVisible)
              NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onItemTapped,
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.history),
                    label: Text('History'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Marketplace'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.stacked_line_chart),
                    label: Text('Stats'),
                  ),
                ],
              ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: _pages[_selectedIndex],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'History Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class MarketplacePage extends StatelessWidget {
  const MarketplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Marketplace Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Stats Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _navigateToSignupPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupPage()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In / Sign Up'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to Brocolini',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _emailController, // Use the email controller
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController, // Use the password controller
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String password = _passwordController.text;
                // Use the email and password for backend processing
              },
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                _navigateToSignupPage();
              },
              child: const Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String _selectedCategory = 'Simple user';
  final List<String> _categories = [
    'Simple user',
    'DIY workshop',
    'Recycling center',
    'Transporter',
  ];
  Future<void> createSimpleUser(
      String s1, String s2, String s3, String s4, String s5) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/auth/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "email": s1,
          "username": s2,
          "password": s3,
          "phoneNumber": s4,
          "category": s5,
        }),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('User created: ${response.body}');
        }
      } else {
        if (kDebugMode) {
          print('Failed to create user: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception occurred: $e');
      }
    }
  }

  void _submitForm() async {
    final String email = _emailController.text;
    final String fullName = _fullNameController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;
    final String phoneNumber = _phoneNumberController.text;
    final String category = _selectedCategory;

    // Reset the text fields
    _emailController.clear();
    _fullNameController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _phoneNumberController.clear();

    // Navigate to the corresponding page based on the selected category
    if (category == 'Simple user') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Simple_User_HomeScreen()),
      );

      await createSimpleUser(email, fullName, password, phoneNumber, category);
    } else if (category == 'DIY workshop') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DIY_Sign_Up(
            email: email,
            fullName: fullName,
            password: password,
            phoneNumber: phoneNumber,
          ),
        ),
      );
    } else if (category == 'Recycling center') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Recycling_Sign_Up(
                  email: email,
                  fullName: fullName,
                  password: password,
                  phoneNumber: phoneNumber,
                )),
      );
    } else if (category == 'Transporter') {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Transporter_Sign_Up(
                  email: email,
                  fullName: fullName,
                  password: password,
                  phoneNumber: phoneNumber,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Next'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class Recycling_Sign_Up extends StatefulWidget {
  final String email;
  final String fullName;
  final String password;
  final String phoneNumber;

  const Recycling_Sign_Up({
    Key? key,
    required this.email,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _Recycling_Sign_UpState createState() => _Recycling_Sign_UpState();
}

class _Recycling_Sign_UpState extends State<Recycling_Sign_Up> {
  final TextEditingController _addressController = TextEditingController();
  int? _selectedItemIndex; // Track the index of the selected item
  // ignore: non_constant_identifier_names
  String Type_Waste = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycling_Company'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _addressController,
              obscureText: true,
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
            buildCheckboxListTile(0, 'Wood_Waste'),
            buildCheckboxListTile(1, 'Metal_Waste'),
            buildCheckboxListTile(2, 'Construction_Waste'),
            buildCheckboxListTile(3, 'Other'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String address = _addressController.text;
                List<bool> checklist = List<bool>.filled(4, false);
                if (_selectedItemIndex != null) {
                  checklist[_selectedItemIndex!] = true;
                }
                // TODO: Perform signup action with the entered data
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

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Recycling_Company_HomeScreen()),
                );
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

class Simple_User_HomeScreen extends StatefulWidget {
  const Simple_User_HomeScreen({super.key});

  @override
  _Simple_User_HomeScreenState createState() => _Simple_User_HomeScreenState();
}

class _Simple_User_HomeScreenState extends State<Simple_User_HomeScreen> {
  int _selectedIndex = 0;
  bool _navigationRailVisible = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _navigationRailVisible = !_navigationRailVisible;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const MarketplacePage(),
    const StatsPage(),
    const SimpleUserOffers(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple User HomeScreen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile_Page()),
              );*/
            },
          ),
        ],
      ),
      body: Row(
        children: [
          if (_navigationRailVisible)
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.shopping_cart),
                  label: Text('Marketplace'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.stacked_line_chart),
                  label: Text('Stats'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add_task),
                  label: Text('Offers'),
                ),
              ],
            ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: _pages[_selectedIndex],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SimpleUserOffers extends StatefulWidget {
  const SimpleUserOffers({super.key});

  @override
  State<SimpleUserOffers> createState() => _SimpleUserOffersState();
}

class _SimpleUserOffersState extends State<SimpleUserOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SimpleUserOffersAdding(
                        title: '',
                      )),
            );
          },
        ),
      ),
    );
  }
}

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
        backgroundColor: Colors.black,
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                const Text(
                  'Submit your offer!',
                  style: TextStyle(fontSize: 30),
                ),

                DropdownButton<String>(
                  value: _garbageType,
                  items: const [
                    DropdownMenuItem(
                        child: Text("garbage type"), value: "garbage type"),
                    DropdownMenuItem(child: Text("Metal"), value: "metal"),
                    DropdownMenuItem(child: Text("Wood"), value: "wood"),
                    DropdownMenuItem(
                        child: Text("Construction waste"),
                        value: "constructionWaste"),
                    DropdownMenuItem(child: Text("Other"), value: "other")
                  ],
                  onChanged: (value) {
                    setState(() {
                      _garbageType = value as String;
                    });
                  },
                ),
                const SizedBox(height: 70), //saut de ligne
                const Text(
                  'Choose garbage location',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 2,
            child: Align(alignment: Alignment.center, child: Text("")),
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
                      builder: (context) => const UploadImage(
                          title: "Upload a photo of your garbage")),
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
}

//////////////deuxieme page/////////////
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
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: _image != null
              ? Image.file(
                  // use Image.file to display image from a local path
                  File(_image!),
                  fit: BoxFit.cover,
                )
              : const Center(
                  child: Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.lightGreen,
                  ),
                ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.lightGreen,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 15.0),
                ),
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
                child: const Text('Choose from Gallery'),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.lightGreen,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 15.0),
                ),
                onPressed: () {
                  getImage(ImageSource.camera);
                },
                child: const Text('Take a Photo'),
              ),
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
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Upload a photo of your garbage!',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 10), //saut de ligne
                const Text(
                  'Regulations require you to upload a photo of your garbage...',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(height: 40),
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
              onPressed: () {},
              child: const Text(
                'Verify',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Recycling_Company_HomeScreen extends StatefulWidget {
  const Recycling_Company_HomeScreen({super.key});

  @override
  _Recycling_Company_HomeScreenState createState() =>
      _Recycling_Company_HomeScreenState();
}

class _Recycling_Company_HomeScreenState
    extends State<Recycling_Company_HomeScreen> {
  int _selectedIndex = 0;
  bool _navigationRailVisible = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _navigationRailVisible = false;
    });
  }

  void _onBackPressed() {
    setState(() {
      _navigationRailVisible = true;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const MarketplacePage(),
    const StatsPage(),
    const RecyclingCompanyReceivedOffers(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onBackPressed();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recycling Company HomeScreen'),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile_Page()),
                );*/
              },
            ),
          ],
        ),
        body: Row(
          children: [
            if (_navigationRailVisible)
              NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onItemTapped,
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Marketplace'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.stacked_line_chart),
                    label: Text('Stats'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.call_received),
                    label: Text('Offers'),
                  ),
                ],
              ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: _pages[_selectedIndex],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecyclingCompanyReceivedOffers extends StatefulWidget {
  const RecyclingCompanyReceivedOffers({Key? key}) : super(key: key);

  @override
  State<RecyclingCompanyReceivedOffers> createState() =>
      _RecyclingCompanyReceivedOffersState();
}

class Offer {
  final String photo;
  final String address;
  final String type;
  final double price;
  final double estimatedDistance;

  Offer({
    required this.photo,
    required this.address,
    required this.type,
    required this.estimatedDistance,
    required this.price,
  });
}

class _RecyclingCompanyReceivedOffersState
    extends State<RecyclingCompanyReceivedOffers> {
  final List<Offer> receivedOffers = [
    Offer(
      photo: 'lib/images/construct.jpg',
      address: '123 Main St',
      type: 'construct',
      estimatedDistance: 2.5,
      price: 200,
    ),
    Offer(
      photo: 'lib/images/metal.jpeg',
      address: '456 Elm St',
      type: 'metal',
      estimatedDistance: 1.8,
      price: 200,
    ),
    Offer(
      photo: 'lib/images/wood.jpeg',
      address: '789 Oak St',
      type: 'wood',
      estimatedDistance: 3.2,
      price: 200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: receivedOffers.length,
        itemBuilder: (context, index) {
          final offer = receivedOffers[index];

          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Choose the desired border color here.
                width: 1.0, // Adjust the border width as needed.
              ),
              borderRadius: BorderRadius.circular(
                  8.0), // Adjust the border radius as needed.
            ),
            child: ListTile(
              leading: Image.asset(
                offer.photo,
                width: 50,
                height: 50,
              ),
              title: Text(offer.address),
              subtitle: Text(
                  '${offer.type} | ${offer.estimatedDistance} km | ${offer.price} \$'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingOfferPage(offer: offer),
                    ),
                  );
                },
                child: const Text('Book Offer'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BookingOfferPage extends StatefulWidget {
  final Offer offer;

  const BookingOfferPage({Key? key, required this.offer}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BookingOfferPageState createState() => _BookingOfferPageState();
}

class _BookingOfferPageState extends State<BookingOfferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Offer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.offer.photo,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              'Address: ${widget.offer.address}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Type: ${widget.offer.type}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Estimated Distance: ${widget.offer.estimatedDistance} km',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Demanded Price: ${widget.offer.price} \$',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FindTrans()),
                );
              },
              child: const Text('Choosing Transporter'),
            ),
          ],
        ),
      ),
    );
  }
}

class FindTrans extends StatefulWidget {
  const FindTrans({Key? key}) : super(key: key);

  @override
  _FindTransState createState() => _FindTransState();
}

class _FindTransState extends State<FindTrans> {
  List<Transporter> historyList = [
    Transporter(
      photo: "lib/images/Logo_Arcturus.png",
      tName: "Ahmed",
      location: "Casablanca",
      pricePerKm: 100,
      vehicule: "camion blabla",
    ),
    Transporter(
      photo: "lib/images/Logo_Arcturus.png",
      tName: "Hamiiid",
      location: "Tunis, Tunisie",
      pricePerKm: 100,
      vehicule: "camion blabla",
    ),
  ];

  void addToHistory(Transporter transporter) {
    setState(() {
      historyList.add(transporter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find a transporter',
          style: TextStyle(color: Colors.lightGreen, fontSize: 20),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (context, index) {
          final offer = historyList[index];

          return Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    offer.photo,
                    width: 50,
                    height: 50,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.tName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${offer.vehicule}',
                      ),
                      Text(
                        '${offer.location}',
                      ),
                      Text(
                        '${offer.pricePerKm} \$',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement button functionality
                    },
                    child: Text('Button'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Transporter {
  final String tName;
  final String photo;
  final String location;
  final String vehicule;
  final double pricePerKm;

  Transporter({
    required this.tName,
    required this.photo,
    required this.location,
    required this.vehicule,
    required this.pricePerKm,
  });
}

class Transporter_HomeScreen extends StatefulWidget {
  const Transporter_HomeScreen({super.key});

  @override
  Transporter_HomeScreenState createState() => Transporter_HomeScreenState();
}

class Transporter_HomeScreenState extends State<Transporter_HomeScreen> {
  int _selectedIndex = 0;
  bool _navigationRailVisible = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _navigationRailVisible = !_navigationRailVisible;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const MarketplacePage(),
    const StatsPage(),
    const TransporterReceivedOffers(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transporter Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TransporterProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Row(
        children: [
          if (_navigationRailVisible)
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: _onItemTapped,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.shopping_cart),
                  label: Text('Marketplace'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.stacked_line_chart),
                  label: Text('Stats'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.add_task),
                  label: Text('Offers'),
                ),
              ],
            ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: _pages[_selectedIndex],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TransporterReceivedOffers extends StatelessWidget {
  const TransporterReceivedOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Offers',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

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
