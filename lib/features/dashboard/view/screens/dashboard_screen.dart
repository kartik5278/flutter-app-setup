import 'package:app_setup/env/app_env.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter.of(context);
    // print(AppEnv().apiUrl);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Page'),
        centerTitle: true,
      ), // AppBar
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // goRouter.go("/login");
            goRouter.go("/dashboard/discover");
          },
          child: const Text("Discover screen"),
        ),
      ),
    ); // MaterialApp
  }
}
