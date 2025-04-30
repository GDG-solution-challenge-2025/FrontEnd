import 'package:flutter/material.dart';

class GlobalCuisineScreen extends StatelessWidget {
  const GlobalCuisineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Cuisine'),
      ),
      body: const Center(
        child: Text(
          'Welcome to Global Cuisine!',
        ),
      ),
    );
  }
}
