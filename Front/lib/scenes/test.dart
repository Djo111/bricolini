import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bricoloni_v2/scenes/web3_service.dart';

class TestBlockchain extends StatefulWidget {
  const TestBlockchain({Key? key}) : super(key: key);
  @override
  State<TestBlockchain> createState() => _TestBlockchainState();
}

class Transaction {
  final int date;
  final String waste;
  final int qte;
  final int price;

  Transaction({
    required this.date,
    required this.waste,
    required this.qte,
    required this.price,
  });
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      date: json['date'],
      price: json['price'],
      qte: json['quantity'],
      waste: json['wasteType'],
    );
  }
}

class _TestBlockchainState extends State<TestBlockchain> {
  Web3Service w3 = Web3Service();

  Future<List<Transaction>> fetchAllOffers() async {
    final response = await http
        .get(Uri.parse('http://localhost:3000/blockchain/transactions'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Transaction> offers =
          jsonList.map((json) => Transaction.fromJson(json)).toList();
      return offers;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load users');
    }
  }

  List<Transaction> receivedOffers = [];
  @override
  void initState() {
    super.initState();
    w3.init();
    // Fetch offers after getting the account address
    fetchAllOffers().then((offers) {
      setState(() {
        receivedOffers.addAll(offers);
      });
      print(receivedOffers.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171918),
      body: ListView.builder(
        itemCount: receivedOffers.length,
        itemBuilder: (context, index) {
          final offer = receivedOffers[index];

          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Choose the desired border color here.
                width: 1.0, // Adjust the border width as needed.
              ),
              borderRadius: BorderRadius.circular(
                  8.0), // Adjust the border radius as needed.
            ),
            child: ListTile(
              textColor: Colors.white10,
              title: Text(offer.date.toString()),
              subtitle:
                  Text('${offer.waste} | ${offer.qte} | ${offer.price} \$'),
              trailing: ElevatedButton(
                onPressed: () {},
                child: const Text('Book Offer'),
              ),
            ),
          );
        },
      ),
    );
  }
}
