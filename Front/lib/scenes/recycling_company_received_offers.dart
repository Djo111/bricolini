import 'package:bricoloni_v2/scenes/booking_offer_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecyclingCompanyReceivedOffers extends StatefulWidget {
  const RecyclingCompanyReceivedOffers({Key? key}) : super(key: key);
  @override
  State<RecyclingCompanyReceivedOffers> createState() =>
      _RecyclingCompanyReceivedOffersState();
}

class Offer {
  final String photo;
  final String address;
  final String type;
  final int price;
  final double estimatedDistance;

  Offer({
    required this.photo,
    required this.address,
    required this.type,
    required this.estimatedDistance,
    required this.price,
  });
  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      photo: json['img'],
      price: 300,
      address: json['location'],
      estimatedDistance: 0,
      type: '',
    );
  }
}

class _RecyclingCompanyReceivedOffersState
    extends State<RecyclingCompanyReceivedOffers> {
  Future<List<Offer>> fetchAllOffers() async {
    final response = await http
        .get(Uri.parse('http://localhost:3000/recycling-centre/offers'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Offer> offers =
          jsonList.map((json) => Offer.fromJson(json)).toList();
      return offers;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load users');
    }
  }

  List<Offer> receivedOffers = [
    Offer(
      photo: 'lib/images/construct.jpg',
      address: '123 Main St',
      type: 'construct',
      estimatedDistance: 2.5,
      price: 200,
    )
  ];
  @override
  void initState() {
    super.initState();
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
              leading: Image.asset(
                offer.photo,
                width: 50,
                height: 50,
              ),
              title: Text(offer.address),
              subtitle: Text(
                  '${offer.type} | ${offer.estimatedDistance} km | ${offer.price} \$'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingOfferPage(offer: offer),
                    ),
                  );
                },
                child: const Text('Book Offer'),
              ),
            ),
          );
        },
      ),
    );
  }
}
