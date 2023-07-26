import 'package:bricoloni_v2/scenes/about-us.dart';
import 'package:bricoloni_v2/scenes/home_page.dart';
import 'package:bricoloni_v2/scenes/marketplace_page.dart';
import 'package:bricoloni_v2/scenes/recycling_company_received_offers.dart';
import 'package:bricoloni_v2/scenes/stats_page.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Recycling_Company_HomeScreen extends StatefulWidget {
  final String wasteType;
  const Recycling_Company_HomeScreen({super.key, required this.wasteType});

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

  final List<IconData> _iconList = [
    Icons.home,
    Icons.shopping_cart,
    Icons.stacked_line_chart,
    Icons.call_received,
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
      RecyclingCompanyReceivedOffers(wasteType: widget.wasteType),
    ];
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
                        print("waste :${widget.wasteType}");
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
