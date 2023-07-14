import 'package:bricoloni_v2/scenes/home_page.dart';
import 'package:bricoloni_v2/scenes/marketplace_page.dart';
import 'package:bricoloni_v2/scenes/stats_page.dart';
import 'package:bricoloni_v2/scenes/transporter_profile_page.dart';
import 'package:bricoloni_v2/scenes/transporter_received_offers.dart';
import 'package:flutter/material.dart';

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
