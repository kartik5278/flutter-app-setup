import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // AppBar
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
          strokeWidth: 2,
        ),
      ),
    ); // MaterialApp
  }
}
