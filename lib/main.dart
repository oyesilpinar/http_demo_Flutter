import 'package:flutter/material.dart';
import 'package:http_demo/screens/main_screen.dart';

void main() {
  runApp(HttpApp());
}

class HttpApp extends StatelessWidget {
  const HttpApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}
