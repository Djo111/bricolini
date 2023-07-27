import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class MyAppBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTabTapped;

  MyAppBar({
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              onTabTapped(0);
            },
            color: currentIndex == 0 ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              onTabTapped(1);
            },
            color: currentIndex == 1 ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.local_offer),
            onPressed: () {
              onTabTapped(2);
            },
            color: currentIndex == 2 ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.bar_chart),
            onPressed: () {
              onTabTapped(3);
            },
            color: currentIndex == 3 ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.store),
            onPressed: () {
              onTabTapped(4);
            },
            color: currentIndex == 4 ? Colors.blue : Colors.grey,
          ),
        ],
      ),
    );
  }
}






class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() =>
      _AddsState();
}

/*class Adds extends StatefulWidget {
  const Adds({Key? key}) : super(key: key);
  @override
  State<Adds> createState() =>
      _AddsState();
}*/

class Add{
  final String username;
  final String description;
  final String img;
  final String userCategory;

  Add({
    required this.username,
    required this.description,
    required this.img,
    required this.userCategory
  });

  factory Add.fromJson(Map<String, dynamic> json){
  return Add(
  username: json['username'],
  description: json['description'],
  img: json['img'],
  userCategory: json['user_category'],
  );
  }
}

class _AddsState
    extends State<HomePage> {
  int _currentIndex = 0;
  Future<List<Add>> fetchAllAdds() async {
    final response = await http
          .get(Uri.parse('http://localhost:3000/adds/accepted'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON.
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Add> adds =
      jsonList.map((json) => Add.fromJson(json)).toList();

      return adds;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load users');
    }
  }

List<Add> allAdds=[

];
@override
void initState() {
  super.initState();
  fetchAllAdds().then((adds) {
    setState(() {
      allAdds.addAll(adds);
    });
    print(allAdds.length);
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: ListView.builder(
      itemCount: allAdds.length,
      itemBuilder: (context, index) {
        return _buildPostContainer(allAdds[index]);
      },
    ),

  );
}

Widget _buildPostContainer(Add post) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey, // Choose the desired border color here.
        width: 1.0, // Adjust the border width as needed.
      ),
      borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed.
    ),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Adjust the border radius to match the Container.
        // You can also add additional border customization here if needed.
      ),
      margin: EdgeInsets.zero, // Remove any margin from the Card.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: CircleAvatar(
              // You can use a NetworkImage or AssetImage based on your data.
              backgroundImage: NetworkImage(post.img),
            ),
            title: Text(post.username),
          ),
          Image.network(post.img),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(post.description),
          ),
        ],
      ),
    ),
  );
}
}

