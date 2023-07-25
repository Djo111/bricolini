import 'package:bricoloni_v2/scenes/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51NURdLJiqOibQhjfx6GwbsZXQpIgylHVPUMTWEmlH7BiOjdsoC0hW7AfCKSL9aZGU6ew9NTNgRbahhmwITpYTIXG00TtsmwGAA';
  Stripe.merchantIdentifier = 'your_merchant_id_here';
  runApp(const MyApp());
}
