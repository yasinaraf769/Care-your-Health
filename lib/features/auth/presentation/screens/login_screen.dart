import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () async {
            await context.read<AuthProvider>().signIn(
              'admin@hospital.test',
              'demo',
            );
            if (context.mounted) context.go('/');
          },
          child: const Text('Continue as demo user'),
        ),
      ),
    );
  }
}
