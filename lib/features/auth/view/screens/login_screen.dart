import 'package:app_setup/core/models/user_model.dart';
import 'package:app_setup/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ), // AppBar
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () async {
                if (!authState.isLoading) {
                  await ref
                      .read(authViewModelProvider.notifier)
                      .loginUser(email: "123@gmail.com", password: "123");
                }
              },
              style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
              child: authState.isLoading
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
        ),
      ),
    ); // MaterialApp
  }
}
