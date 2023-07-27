import 'dart:io';
import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

void runModelOnImage() async {
  final interpreter = await Interpreter.fromAsset('classifier.tflite');

  // Load image and resize
  img.Image? image =
      img.decodeImage(File('lib/images/construct.jpg').readAsBytesSync());
  img.Image resizedImg = img.copyResize(image!, width: 224, height: 224);

  // Image to byte data and then convert to Float32
  var imgBytes = resizedImg.getBytes();
  var imgAsList = imgBytes.buffer.asUint8List();
  Float32List inputImage = Float32List(1 * 224 * 224 * 3);
  for (var i = 0; i < imgAsList.lengthInBytes; i++) {
    inputImage[i] = imgAsList[i] / 255.0;
  }

  // Create output tensor
  List<double> output = List.filled(3, 0);

  // Run the model
  interpreter.run(inputImage, output);

  // Output will now contain the results
  print(output);
}
