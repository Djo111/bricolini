import 'package:bricoloni_v2/scenes/home_page.dart';
import 'package:bricoloni_v2/scenes/marketplace_page.dart';
import 'package:bricoloni_v2/scenes/recycling_company_received_offers.dart';
import 'package:bricoloni_v2/scenes/stats_page.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
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

  void _toggleNavigationBar() {
    setState(() {
      _navigationRailVisible = !_navigationRailVisible;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const MarketplacePage(),
    const StatsPage(),
    const RecyclingCompanyReceivedOffers(),
  ];

  final List<IconData> _iconList = [
    Icons.home,
    Icons.shopping_cart,
    Icons.stacked_line_chart,
    Icons.call_received,
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
          title: const Text('Recycling Company HomeScreen'),
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
