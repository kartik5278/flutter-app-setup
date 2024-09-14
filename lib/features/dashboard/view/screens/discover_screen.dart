import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover SCreen'),
        centerTitle: true,
      ), // AppBar
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Back"),
        ),
      ),
    ); // MaterialApp
  }
}
