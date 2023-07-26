import 'package:bricoloni_v2/scenes/find_trans.dart';
import 'package:bricoloni_v2/scenes/recycling_company_received_offers.dart';
import 'package:flutter/material.dart';

class BookingOfferPage extends StatefulWidget {
  final Offer offer;

  const BookingOfferPage({Key? key, required this.offer}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BookingOfferPageState createState() => _BookingOfferPageState();
}

class _BookingOfferPageState extends State<BookingOfferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171918),
      appBar: AppBar(
        title: const Text('Booking Offer'),
        backgroundColor: const Color(0xFF171918),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.offer.photo,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              'Address: ${widget.offer.address}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Type: ${widget.offer.type}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Estimated Distance: ${widget.offer.estimatedDistance} km',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Demanded Price: ${widget.offer.price} \$',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FindTrans(location: widget.offer.address)),
                );
              },
              child: const Text('Choosing Transporter'),
            ),
          ],
        ),
      ),
    );
  }
}
