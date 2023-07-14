import 'dart:convert';

import 'package:bricoloni_v2/scenes/recycling_sign_up.dart';
import 'package:bricoloni_v2/scenes/simple_user_home_screen.dart';
import 'package:bricoloni_v2/scenes/transporter_sign_up.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'diy_sign_up.dart';

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
