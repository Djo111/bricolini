import 'package:bricoloni_v2/scenes/about-us.dart';
import 'package:bricoloni_v2/scenes/home_page.dart';
import 'package:bricoloni_v2/scenes/marketplace_page.dart';
import 'package:bricoloni_v2/scenes/recycling_company_received_offers.dart';
import 'package:bricoloni_v2/scenes/stats_page.dart';
import 'package:flutter/material.dart';

class Recycling_Company_HomeScreen extends StatefulWidget {
  final String wasteType;
  final String id;
  const Recycling_Company_HomeScreen({
    Key? key,
    required this.wasteType,
    required this.id,
  }) : super(key: key);

  @override
  _Recycling_Company_HomeScreenState createState() =>
      _Recycling_Company_HomeScreenState();
}

class _Recycling_Company_HomeScreenState
    extends State<Recycling_Company_HomeScreen> {
  int _selectedIndex = 0;

  final List<IconData> _iconList = [
    Icons.home,
    Icons.shopping_cart,
    Icons.stacked_line_chart,
    Icons.call_received,
    Icons.offline_pin_rounded,
  ];

  void _goToAboutUsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => About_Us()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _pages = [
      const HomePage(),
      const MarketplacePage(),
      const StatsPage(),
      RecyclingCompanyReceivedOffers(
        wasteType: widget.wasteType,
        id: widget.id,
      ),
      Recycling_center_confirmed_offer(id: widget.id)
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF171918),
      appBar: AppBar(
        title: const Text('Recycling Company HomeScreen'),
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
            icon: Icon(Icons.call_received),
            label: 'Received Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_pin_rounded),
            label: 'Confirmed Offers',
          )
        ],
      ),
    );
  }
}
