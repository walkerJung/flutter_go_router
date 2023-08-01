import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('error'),
      ),
      body: ListView(
        children: [
          const Text('Error'),
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('홈으로'),
          ),
        ],
      ),
    );
  }
}
