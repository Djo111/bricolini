import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      home: const LeftHomeScreen(),
    );
  }
}

class LeftHomeScreen extends StatefulWidget {
  const LeftHomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LeftHomeScreenState createState() => _LeftHomeScreenState();
}

class _LeftHomeScreenState extends State<LeftHomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
    return Scaffold(
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
  final bool _isSigningIn = true;

  void _navigateToSignupPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
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
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text(_isSigningIn ? 'Sign In' : 'Sign Up'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                _navigateToSignupPage();
              },
              child: Text(
                _isSigningIn
                    ? 'Don\'t have an account? Sign Up'
                    : 'Already have an account? Sign In',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String _selectedCategory = 'Simple_user';
  final List<String> _categories = [
    'Simple_user',
    'DIY_Workshop',
    'Recycling_Company',
    'Transporter',
  ];

  void _submitForm() {
    final String email = _emailController.text;
    final String fullName = _fullNameController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;
    final String phoneNumber = _phoneNumberController.text;
    final String category = _selectedCategory;

    // TODO: Implement backend logic using the form values

    // Reset the text fields
    _emailController.clear();
    _fullNameController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _phoneNumberController.clear();

    // Navigate to the corresponding page based on the selected category
    if (category == 'Simple_user') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Simple_User_Sign_Up()),
      );
    } else if (category == 'DIY_Workshop') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DIY_Sign_Up()),
      );
    } else if (category == 'Recycling_Company') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Recycling_Sign_Up()),
      );
    } else if (category == 'Transporter') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Transporter_Sign_Up()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Container(
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
    );
  }
}

// ignore: camel_case_types
class Simple_User_Sign_Up extends StatelessWidget {
  const Simple_User_Sign_Up({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category 1 Page'),
      ),
      body: const Center(
        child: Text(
          'Category 1 Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class DIY_Sign_Up extends StatelessWidget {
  final TextEditingController _addressController = TextEditingController();
  final List<bool> _checklistValues = [false, false, false, false];

  DIY_Sign_Up({super.key});

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
            CheckboxListTile(
              title: const Text('WoodWaste'),
              value: _checklistValues[0],
              onChanged: (value) {
                _checklistValues[0] = value!;
                _checklistValues[0]
                    ? Icon(Icons.check, color: Colors.green)
                    : null;
              },
            ),
            CheckboxListTile(
              title: const Text('MetalWaste'),
              value: _checklistValues[1],
              onChanged: (value) {
                _checklistValues[1] = value!;
                _checklistValues[1]
                    ? Icon(Icons.check, color: Colors.green)
                    : null;
              },
            ),
            CheckboxListTile(
              title: const Text('ConstructionWaste'),
              value: _checklistValues[2],
              onChanged: (value) {
                _checklistValues[2] = value!;
                _checklistValues[2]
                    ? Icon(Icons.check, color: Colors.green)
                    : null;
              },
            ),
            CheckboxListTile(
              title: const Text('Other'),
              value: _checklistValues[3],
              onChanged: (value) {
                _checklistValues[3] = value!;
                _checklistValues[3]
                    ? Icon(Icons.check, color: Colors.green)
                    : null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Access the entered address and checklist values
                String address = _addressController.text;
                List<bool> checklist = _checklistValues;

                // TODO: Perform signup action with the entered data
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Recycling_Sign_Up extends StatefulWidget {
  Recycling_Sign_Up({super.key});
  final TextEditingController _addressController = TextEditingController();
  final List<bool> _checklistValues = [false, false, false, false];
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
            CheckboxListTile(
              title: const Text('Wood_Waste'),
              value: _checklistValues[0],
              onChanged: (value) {
                _checklistValues[0] = value!;
              },
              secondary: _checklistValues[0]
                  ? Icon(Icons.check, color: Colors.green)
                  : null,
            ),
            CheckboxListTile(
              title: const Text('Metal_Waste'),
              value: _checklistValues[1],
              onChanged: (value) {
                _checklistValues[1] = value!;
              },
              secondary: _checklistValues[1]
                  ? Icon(Icons.check, color: Colors.green)
                  : null,
            ),
            CheckboxListTile(
              title: const Text('Construction_Waste'),
              value: _checklistValues[2],
              onChanged: (value) {
                _checklistValues[2] = value!;
              },
              secondary: _checklistValues[2]
                  ? Icon(Icons.check, color: Colors.green)
                  : null,
            ),
            CheckboxListTile(
              title: const Text('Other'),
              value: _checklistValues[3],
              onChanged: (value) {
                _checklistValues[3] = value!;
              },
              secondary: _checklistValues[3]
                  ? Icon(Icons.check, color: Colors.green)
                  : null,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Access the entered address and checklist values
                String address = _addressController.text;
                List<bool> checklist = _checklistValues;

                // TODO: Perform signup action with the entered data
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class Transporter_Sign_Up extends StatelessWidget {
  const Transporter_Sign_Up({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category 4 Page'),
      ),
      body: const Center(
        child: Text(
          'Category 4 Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
