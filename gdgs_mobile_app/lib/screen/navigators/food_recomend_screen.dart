import 'package:flutter/material.dart';

class FoodRecomendScreen extends StatelessWidget {
  const FoodRecomendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Recomend Screen'),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Food Recomend Screen!',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
