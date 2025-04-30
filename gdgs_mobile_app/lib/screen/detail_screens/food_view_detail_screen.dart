import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:go_router/go_router.dart';

class FoodViewDetailScreen extends StatelessWidget {
  const FoodViewDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food View Detail Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.goNamed(AppRoute.home);
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Food View Detail Screen!',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(AppRoute.home);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
