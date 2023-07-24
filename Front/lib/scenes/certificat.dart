import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/widgets.dart' as pw; // Make sure to include this line
import 'dart:io';
import 'dart:math';
/*
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

 */

class ScorePage extends StatelessWidget {
  final double userScore =1110;
  double savedCo2=1;// Replace this with the actual user score
  Future<File> generatePDF() async {
    final pdf = pw.Document();

    final fontData = await File('assets/fonts/Helvetica.ttf').readAsBytes();
    final ttfFont = pw.Font.ttf(fontData.buffer.asByteData());

    // Create a PdfGoogleFont from the ttfFont
    final font = pw.Font.ttf(ttfFont as ByteData);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              'Hello, this is your PDF content!',
              style: pw.TextStyle(font: font, fontSize: 20),
            ),
          );
        },
      ),
    );

    final output = File('example.pdf');
    try {
      await output.writeAsBytes(await pdf.save());
      return output;
    } catch (e) {
      print('Error generating PDF: $e');

      // If there was an error, return an empty PDF file with an error message
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Text(
                'Error generating PDF: $e',
                style: pw.TextStyle(font: font, fontSize: 20),
              ),
            );
          },
        ),
      );

      final errorOutput = File('error_example.pdf');
      await errorOutput.writeAsBytes(await pdf.save());
      return errorOutput;
    }
  }

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
            CircularProgressBar(progressValue: savedCo2),
            Text('CO2 saved quantity ', style: TextStyle(color: Colors.white),),
            SizedBox(height: 50),
            SizedBox(height: 50),
            HorizontalLineWithText(
              url: 'https://www.example.com',
              clickableText: 'download',
              nonClickableText: 'Download your actual certification here : ',
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.brown), // Set the background color here
              ),
              onPressed: () async {
                File pdfFile = await generatePDF();
                String path = pdfFile.path;
                // Use the url_launcher package to open the file in a PDF viewer
                if (await canLaunch(path)) {
                  await launch(path);
                } else {
                  throw 'Could not launch $path';
                }
              },
              child: const Text('Download PDF'),
            ),

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
            '${(progressValue).toInt()/100} CO2kg',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
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
      ..shader = RadialGradient(
        colors: [Colors.blue, Colors.green], // Add the colors you want for the gradient here
        center: Alignment.center,
        radius: 0.8, // Adjust the radius to control the size of the gradient within the circle
        tileMode: TileMode.clamp,
      ).createShader(Rect.fromCircle(center:Offset(0, 0) , radius: 0.5))
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

class HorizontalLineWithText extends StatelessWidget {
  final String url;
  final String clickableText;
  final String nonClickableText;

  HorizontalLineWithText({
    required this.url,
    required this.clickableText,
    required this.nonClickableText,
  });

  void _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.black,
                height: 1,
                thickness: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 8), // Add some spacing between the line and the text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              nonClickableText,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(width: 8), // Add some spacing between the two texts
            GestureDetector(
              onTap: _launchURL,
              child: Text(
                clickableText,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
