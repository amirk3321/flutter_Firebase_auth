import 'package:flutter/material.dart';
class  SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Splash Screen"),),
      body: Center(child: Text("Splash Screen"),),
    );
  }
}