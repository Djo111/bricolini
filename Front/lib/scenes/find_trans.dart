import 'package:bricoloni_v2/scenes/paiement.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FindTrans extends StatefulWidget {
  final String location;
  const FindTrans({Key? key, required this.location}) : super(key: key);

  @override
  _FindTransState createState() => _FindTransState();
}

class Transporter {
  final String tName;
  final String photo;
  final String location;
  final String vehicule;
  final double pricePerKm;

  Transporter({
    required this.tName,
    required this.photo,
    required this.location,
    required this.vehicule,
    required this.pricePerKm,
  });
  factory Transporter.fromJson(Map<String, dynamic> json) {
    return Transporter(
      tName: json['username'],
      photo: "lib/images/Logo_Arcturus.png",
      location: json['location'],
      vehicule: "",
      pricePerKm: 10,
    );
  }
}

class _FindTransState extends State<FindTrans> {
  List<Transporter> historyList = [];
  Future<List<Transporter>> fetchAllOffers() async {
    final response = await http.get(Uri.parse(
        'http://localhost:3000/recycling-centre/transporters/:category'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Transporter> transporters =
          jsonList.map((json) => Transporter.fromJson(json)).toList();
      return transporters;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load transporters');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAllOffers().then((offers) {
      setState(() {
        historyList
            .addAll(offers.where((offer) => offer.location == widget.location));
      });
      print(historyList.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171918),
      appBar: AppBar(
        backgroundColor: const Color(0xFF171918),
        title: Text(
          'Find a transporter',
          style: TextStyle(color: Colors.lightGreen, fontSize: 20),
        ),
      ),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (context, index) {
          final offer = historyList[index];

          return Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.asset(
                    offer.photo,
                    width: 50,
                    height: 50,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer.tName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${offer.vehicule}',
                      ),
                      Text(
                        '${offer.location}',
                      ),
                      Text(
                        '${offer.pricePerKm} \$',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Paiement()),
                      );
                    },
                    child: Text('Button'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
