import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:go_router/go_router.dart';

class FoodUploadScreen extends StatelessWidget {
  const FoodUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Upload Screen'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'Welcome to the Food Upload Screen!',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(AppRoute.foodViewDetail);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
