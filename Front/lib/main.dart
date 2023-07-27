import 'package:bricoloni_v2/scenes/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:bricoloni_v2/scenes/web3_service.dart';

void main() async {
  final web3Service = Web3Service();
  await web3Service.init();
  runApp(MyApp(web3Service));
}
