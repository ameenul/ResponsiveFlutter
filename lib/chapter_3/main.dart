import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlexibleExpandedExample(),
    );
  }
}

class FlexibleExpandedExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flexible & Expanded Example")),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(color: Colors.red, child: Center(child: Text("Expanded 2x"))),
          ),
          Flexible(
            flex: 1,
            child: Container(color: Colors.green, child: Center(child: Text("Flexible 1x"))),
          ),
          Expanded(
            flex: 1,
            child: Container(color: Colors.blue, child: Center(child: Text("Expanded 1x"))),
          ),
        ],
      ),
    );
  }
}
