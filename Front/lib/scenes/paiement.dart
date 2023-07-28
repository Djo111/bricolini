import 'dart:convert';
import 'package:bricoloni_v2/scenes/recycling_company_home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Paiement extends StatelessWidget {
  final int price;
  final String waste;
  const Paiement({super.key, required this.price, required this.waste});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stripe Payment'),
        ),
        body: Center(
          child: PaymentForm(),
        ),
      ),
    );
  }
}

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  Future<String> receiveBadge() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/blockchain/badges'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      String badge = response.body;
      return badge;
    } else {
      print(response.statusCode);
      return "";
    }
  }

  Future<void> createTRANSACTION(int s1, String s2) async {
    final response = await http.post(
        Uri.parse('http://localhost:3000/blockchain/transactions'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "wasteType": s1,
          "price": s2,
          "quantity": 1200,
          "date": 120424
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      String s = await receiveBadge();
      String image = "";
      switch (s) {
        case "Gold":
          image = "lib/images/gold2Asset .png";
          break;
        case "Silver":
          image = "lib/images/silverAsset 1.png";
          break;
        case "Bronze":
          image = "lib/images/bronzeAsset 2.png";
          break;
        default:
          image = "";
      }

      if (image != "") {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Payment Intent Created'),
            content: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(seconds: 2),
              builder: (BuildContext context, double opacity, Widget? child) {
                return AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(seconds: 1),
                  child: Image.network(image),
                );
              },
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Recycling_Company_HomeScreen(
                        wasteType: '', id: "", badge: image))),
              ),
            ],
          ),
        );
      }
    }
  }

  Future<void> createPaymentIntent() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse(
            'http://localhost:3000/payment/create-payment-intent'), // replace with your server address
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final String clientSecret = jsonDecode(response.body)['clientSecret'];
        print('Client secret: $clientSecret');
        // Use clientSecret to complete the payment on the frontend
        // As we can't make Stripe's client-side calls directly, we just print the client secret here
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Payment Intent Created'),
            content: Text('Client secret: $clientSecret'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Recycling_Company_HomeScreen(
                        wasteType: '', id: ""))),
              ),
            ],
          ),
        );
      } else {
        if (kDebugMode) {
          print('Failed to create payment intent.${response.statusCode}');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _cardNumberController,
            decoration: const InputDecoration(labelText: 'Card number'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter card number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _expiryDateController,
            decoration: const InputDecoration(labelText: 'Expiry date'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter expiry date';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _cvvController,
            decoration: const InputDecoration(labelText: 'CVV'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter CVV';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: createPaymentIntent,
            child: const Text('Pay'),
          ),
        ],
      ),
    );
  }
}
