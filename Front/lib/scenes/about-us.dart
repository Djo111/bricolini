import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About_Us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child :AppBar(
          backgroundColor: Colors.black87,
          leadingWidth: 100,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/Logo_Arcturus.png',
                width:45,// Replace with your logo image path
                height:45,
                // You can adjust the height of the logo as needed
              ),
              SizedBox(width: 8),
              Text(
                'Bricolini',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen,
                ),
              ),
            ],
          ),
        ),),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildRoundedContainer(
                'Bricolini - Revolutionizing Construction Waste Management',
                24,
              ),
              SizedBox(height: 16.0),
              _buildRoundedContainer(
                'At Bricolini, we are passionate about sustainability and committed to transforming the way construction waste is handled. We specialize in collecting construction garbage from building sites and facilitating its efficient recycling and repurposing. Our mission is to minimize the environmental impact of construction projects while maximizing the value of discarded materials.',
                14,
              ),
              SizedBox(height: 16.0),
              _buildRoundedContainer(
                'Join us at Bricolini as we lead the way in revolutionizing construction waste management. Together, we can create a greener, more sustainable future while unlocking the hidden value in discarded construction materials. Contact us today to explore how we can tailor our waste management solutions to meet your specific needs and contribute to a more circular economy.',
                14,
              ),
              SizedBox(height: 32.0),
              Text(
                'Statistics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatisticCard('+30 000', 'cubic meters of landfill space'),
                  _buildStatisticCard('85%', 'recycling rate for construction waste '),
                  _buildStatisticCard('1M \$', 'Revenue'),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black87,
      ),
    );
  }

  Widget _buildRoundedContainer(String text, double fontSize) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black, // Set the border color here
          width: 2, // Set the border width here
        ),
        color: Colors.brown,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildStatisticCard(String title, String value) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.brown, // Set the border color here
          width: 2, // Set the border width here
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          SizedBox(height: 2.0),
          Text(
            value,
            style: TextStyle(fontSize: 10, color: Colors.black),
          ),
        ],
      ),

    );

  }
}