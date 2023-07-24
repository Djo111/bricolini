import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScorePage(),
    );
  }
}

class ScorePage extends StatelessWidget {
  final double userScore =1110; // Replace this with the actual user score

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Environmental Certification', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen),),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBadgeWidget(),
            Text(
              'Your Score',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),
            _buildProgressBar(),
            SizedBox(height: 20),
            //CircularProgressBar(progressValue: userScore),

          ],
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }

  Widget _buildProgressBar() {
    final double progress = userScore.clamp(0, 2000) / 2000;
    return Container(
      width: 300,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Colors.black, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: 300 * progress,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [Colors.brown, Colors.lightGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: Text(
              '${(progress * 100).toInt()}%',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeWidget() {
    if (userScore >= 1000) {
      return _buildBadge('badge3', '+1000');
    } else if (userScore >= 2000) {
      return _buildBadge('badge2', '+2000');

    }else if (userScore >= 3000) {
      return _buildBadge('badge1', '+3000');
    }else {
      return Container();
    }
  }

  Widget _buildBadge(String badgeName, String title) {
    return Image.network("lib/images/" + badgeName +".png",
    width: 150,
    height: 150,);
  }
}

class CircularProgressBar extends StatelessWidget {
  final double progressValue;

  const CircularProgressBar({required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: CustomPaint(
        painter: CircularProgressBarPainter(progressValue),
        child: Center(
          child: Text(
            '${(progressValue).toInt()}%',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class CircularProgressBarPainter extends CustomPainter {
  final double progressValue;

  CircularProgressBarPainter(this.progressValue);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue // Change the color of the progress bar here
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    final double startAngle = -pi / 2; // Start at 12 o'clock position
    final double sweepAngle = 2 * pi * progressValue;

    final Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2 - 10);

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
