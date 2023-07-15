import 'package:bricoloni_v2/scenes/simple_user_offers_adding.dart';
import 'package:flutter/material.dart';

class SimpleUserOffers extends StatefulWidget {
  const SimpleUserOffers({super.key});

  @override
  State<SimpleUserOffers> createState() => _SimpleUserOffersState();
}

class _SimpleUserOffersState extends State<SimpleUserOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171918),
      body: Center(
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SimpleUserOffersAdding(
                        title: '',
                      )),
            );
          },
        ),
      ),
    );
  }
}
