import 'package:bricoloni_v2/scenes/home_page.dart';
import 'package:bricoloni_v2/scenes/marketplace_page.dart';
import 'package:bricoloni_v2/scenes/recycling_company_received_offers.dart';
import 'package:bricoloni_v2/scenes/stats_page.dart';
import 'package:flutter/material.dart';

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
