import 'package:bricoloni_v2/scenes/booking_offer_page.dart';
import 'package:flutter/material.dart';

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
  final double price;
  final double estimatedDistance;

  Offer({
    required this.photo,
    required this.address,
    required this.type,
    required this.estimatedDistance,
    required this.price,
  });
}

class _RecyclingCompanyReceivedOffersState
    extends State<RecyclingCompanyReceivedOffers> {
  final List<Offer> receivedOffers = [
    Offer(
      photo: 'lib/images/construct.jpg',
      address: '123 Main St',
      type: 'construct',
      estimatedDistance: 2.5,
      price: 200,
    ),
    Offer(
      photo: 'lib/images/metal.jpeg',
      address: '456 Elm St',
      type: 'metal',
      estimatedDistance: 1.8,
      price: 200,
    ),
    Offer(
      photo: 'lib/images/wood.jpeg',
      address: '789 Oak St',
      type: 'wood',
      estimatedDistance: 3.2,
      price: 200,
    ),
  ];

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
