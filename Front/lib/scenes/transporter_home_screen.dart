import 'package:bricoloni_v2/scenes/home_page.dart';
import 'package:bricoloni_v2/scenes/marketplace_page.dart';
import 'package:bricoloni_v2/scenes/profile.dart';
import 'package:bricoloni_v2/scenes/stats_page.dart';
import 'package:bricoloni_v2/scenes/transporter_received_offers.dart';
import 'package:flutter/material.dart';
import 'package:bricoloni_v2/scenes/profile.dart';

// ignore: camel_case_types
class Transporter_HomeScreen extends StatefulWidget {
  const Transporter_HomeScreen({super.key});

  @override
  Transporter_HomeScreenState createState() => Transporter_HomeScreenState();
}

class Transporter_HomeScreenState extends State<Transporter_HomeScreen> {
  int _selectedIndex = 0;
  bool _navigationRailVisible = true;

  void _toggleNavigationBar() {
    setState(() {
      _navigationRailVisible = !_navigationRailVisible;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const MarketplacePage(),
    const StatsPage(),
    const TransporterReceivedOffers(),
    const Profile(),
  ];

  final List<IconData> _iconList = [
    Icons.home,
    Icons.shopping_cart,
    Icons.stacked_line_chart,
    Icons.add_task,
    Icons.person_2,
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!_navigationRailVisible) {
          _toggleNavigationBar();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF171918),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(_navigationRailVisible ? Icons.menu_open : Icons.menu),
            onPressed: _toggleNavigationBar,
          ),
          title: const Text('Transporter Home Screen'),
        ),
        body: Row(
          children: [
            if (_navigationRailVisible)
              Container(
                width: 92,
                height: double.infinity,
                color: const Color(0xFF171918),
                child: ListView.builder(
                  itemCount: _iconList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          _iconList[index],
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: _pages[_selectedIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
