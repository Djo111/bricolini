import 'package:bricoloni_v2/scenes/home_page.dart';
import 'package:bricoloni_v2/scenes/marketplace_page.dart';
import 'package:bricoloni_v2/scenes/simple_user_offers.dart';
import 'package:bricoloni_v2/scenes/stats_page.dart';
import 'package:flutter/material.dart';

class Simple_User_HomeScreen extends StatefulWidget {
  final String id;
  const Simple_User_HomeScreen({Key? key, required this.id}) : super(key: key);

  @override
  _Simple_User_HomeScreenState createState() => _Simple_User_HomeScreenState();
}

class _Simple_User_HomeScreenState extends State<Simple_User_HomeScreen> {
  int _selectedIndex = 0;
  bool _navigationRailVisible = true;

  late List<Widget> _pages;
  final List<IconData> _iconList = [
    Icons.home,
    Icons.shopping_cart,
    Icons.stacked_line_chart,
    Icons.add_task,
  ];

  @override
  void initState() {
    print("homescreen:${widget.id}");
    super.initState();
    _pages = [
      const HomePage(),
      const MarketplacePage(),
      const StatsPage(),
      SimpleUserOffers(id: widget.id),
    ];
  }

  void _toggleNavigationBar() {
    setState(() {
      _navigationRailVisible = !_navigationRailVisible;
    });
  }

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
          title: const Text('Simple User HomeScreen', style: TextStyle(color: Colors.lightGreen, fontSize: 20),),
          backgroundColor: Colors.black,
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
