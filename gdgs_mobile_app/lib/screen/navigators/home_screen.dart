import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.goNamed(AppRoute.foodUpload);
            },
            child: const Text(
              "Upload Food",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(AppRoute.globalCuisine);
            },
            child: const Text(
              "global Cuisine",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(AppRoute.foodViewDetail);
            },
            child: const Text(
              "View Food Detail",
            ),
          ),
          // Add more widgets here as needed
        ],
      ),
    );
  }
}
