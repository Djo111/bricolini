import 'package:bricoloni_v2/scenes/about-us.dart';
import 'package:bricoloni_v2/scenes/home_page.dart';
import 'package:bricoloni_v2/scenes/marketplace_page.dart';
import 'package:bricoloni_v2/scenes/profile.dart';
import 'package:bricoloni_v2/scenes/stats_page.dart';
import 'package:bricoloni_v2/scenes/transporter_received_offers.dart';
import 'package:flutter/material.dart';

class Transporter_HomeScreen extends StatefulWidget {
  final String id;
  const Transporter_HomeScreen({Key? key, required this.id}) : super(key: key);

  @override
  Transporter_HomeScreenState createState() => Transporter_HomeScreenState();
}

class Transporter_HomeScreenState extends State<Transporter_HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> get _pages => [
        const HomePage(),
        const MarketplacePage(),
        const StatsPage(),
        TransporterReceivedOffers(id: widget.id),
        const Profile(title: ''),
      ];

  void _goToAboutUsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => About_Us()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171918),
      appBar: AppBar(
        title: const Text('Transporter Home Screen'),
        actions: [
          GestureDetector(
            onTap: _goToAboutUsPage,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset('lib/images/Logo_Arcturus.png',
                  width: 40, height: 40),
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF171918),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue, // Change this to your desired color
        currentIndex: _selectedIndex,
        onTap: (index) {
          print(widget.id);
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_line_chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task),
            label: 'Received Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
