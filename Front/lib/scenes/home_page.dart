import 'package:flutter/material.dart';
import 'package:http/http.d    art' as http;
import 'dart:convert';



class Adds extends StatefulWidget {
  const Adds({Key? key}) : super(key: key);
  @override
  State<Adds> createState() =>
      _AddsState();
}

class Add{
  String username;
  String description;
  String img;
  String user_category;

  Add({
    required this.username,
    this.description,
    this.img,
    required this.user_category
  });

  factory Add.fromJson(Map<String, dynamic>){
  return Add(
  username: json['username'],
  description: json['description'],
  img: json['img'],
  user_category: json['user_category'],
  );
  }
}

calss _AddsState extends State<Adds>{
Future<List<Add> fetchAllAdds() async{
  final response = await http.get(Uri.parse('http://localhost:3000/adds'));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON.
    List<dynamic> jsonList = jsonDecode(response.body);
    List<Add> adds =
    jsonList.map((json) => Offer.fromJson(json)).toList();
    return adds;
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load adds');
  }
}

List<Add> AllAdds=[];
@override
void initState() {
  super.initState();
  fetchAllAdds().then((adds) {
    setState(() {
      AllAdds.addAll(adds);
    });
    print(AllAdds.length);
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFF171918),
    body: ListView.builder(
      itemCount: AllAdds.length,
      itemBuilder: (context, index) {
        return _buildPostContainer(adds[index]);
      },
    ),
  );
}

Widget _buildPostContainer(Add post) {
  return Card(
    margin: EdgeInsets.all(8.0),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
    ListTile(
    leading: //CircleAvatar(
    // You can use a NetworkImage or AssetImage based on your data.
    // backgroundImage: NetworkImage(post.img),
    //),
    title: Text(post.username),
  ),
  Image.network(post.imageUrl),
  Padding(
  padding: EdgeInsets.all(16.0),
  child: Text(post.description),
  ),
  ],
  ),
  );
}
}

