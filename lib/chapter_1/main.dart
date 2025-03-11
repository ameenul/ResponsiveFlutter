import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaQueryExample(),
    );
  }
}

class MediaQueryExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(title: Text("MediaQuery Example")),
      body: Center(
        child: Container(
          width: screenWidth * 0.8,  // 80% dari lebar layar
          height: screenHeight * 0.4, // 40% dari tinggi layar
          color: isPortrait ? Colors.blue : Colors.green,
          child: Center(
            child: Text(
              "Lebar: ${screenWidth.toStringAsFixed(2)} px\nTinggi: ${screenHeight.toStringAsFixed(2)} px\nOrientasi: ${isPortrait ? 'Portrait' : 'Landscape'}",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
