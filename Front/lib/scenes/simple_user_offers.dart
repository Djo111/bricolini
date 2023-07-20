import 'package:bricoloni_v2/scenes/simple_user_offers_adding.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleUserOffers extends StatefulWidget {
  String id;
  SimpleUserOffers({Key? key, required this.id}) : super(key: key);

  @override
  State<SimpleUserOffers> createState() => _SimpleUserOffersState();
}

class _SimpleUserOffersState extends State<SimpleUserOffers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SimpleUserOffersAdding(
                        title: '',
                        id: widget.id,
                      )),
            );
          },
        ),
      ),
    );
  }
}
