import 'package:flutter/material.dart';
import 'package:flutter_go_router/layout/default_layout.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: const [],
      ),
    );
  }
}
