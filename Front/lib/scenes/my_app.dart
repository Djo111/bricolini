import 'package:bricoloni_v2/pages/SimpleUserProfile.dart';
import 'package:bricoloni_v2/scenes/home_page.dart';
import 'package:bricoloni_v2/scenes/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:bricoloni_v2/scenes/web3_service.dart';
class MyApp extends StatelessWidget {
  final Web3Service web3Service;
  const MyApp(this.web3Service) ;
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bricolini',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}
