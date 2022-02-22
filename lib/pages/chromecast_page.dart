import 'package:flutter/material.dart';
import 'package:vortex/theme/color.dart';

class ChromecastPage extends StatefulWidget {
  @override
  _ChromecastPageState createState() => _ChromecastPageState();
}

class _ChromecastPageState extends State<ChromecastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Text(
          "Chromecast Page",
          style: TextStyle(color: white),
        ),
      ),
    );
  }
}
