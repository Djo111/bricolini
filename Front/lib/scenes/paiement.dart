import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

// ignore: camel_case_types
class Paiement extends StatefulWidget {
  const Paiement({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaiementState createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay With a Credit Card'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            // use ListView instead of Column
            children: [
              Text(
                'Card Form',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              CardFormField(controller: CardFormEditController()),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Pay'),
              )
            ],
          )),
    );
  }
}
