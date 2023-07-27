import 'package:flutter/material.dart';
import 'package:stripe_sdk/stripe_sdk.dart' as stripe;

class Paiement extends StatefulWidget {
  @override
  _PaiementState createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _cardNumber;
  late int _expiryMonth;
  late int _expiryYear;
  late String _cvc;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState?.save();

    stripe.Stripe.apiKey =
        "pk_test_51NURdLJiqOibQhjfx6GwbsZXQpIgylHVPUMTWEmlH7BiOjdsoC0hW7AfCKSL9aZGU6ew9NTNgRbahhmwITpYTIXG00TtsmwGAA";

    final paymentMethod = await stripe.Stripe.instance.createPaymentMethod(
      stripe.PaymentMethodRequest(
          card: stripe.CardParams(
              number: _cardNumber,
              expMonth: _expiryMonth,
              expYear: _expiryYear,
              cvc: _cvc)),
    );

    final clientSecret = '<client_secret>';

    final paymentIntent = await stripe.Stripe.instance.confirmPaymentIntent(
      stripe.PaymentIntentConfirmParams(
        paymentMethodId: paymentMethod.id,
        clientSecret: clientSecret,
      ),
    );

    if (paymentIntent.status == stripe.PaymentIntentStatus.succeeded) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Payment succeeded.')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Payment failed.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stripe Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Card number',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your card number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cardNumber = value!;
                },
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Expiry month',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the expiry month';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _expiryMonth = int.parse(value!);
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Expiry year',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the expiry year';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _expiryYear = int.parse(value!);
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'CVC',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the CVC';
                  }
                  return null;
                },
                onSaved: (value) {
                  _cvc = value!;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
