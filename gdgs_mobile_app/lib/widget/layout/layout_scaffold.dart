import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/models/destination.dart';
import 'package:go_router/go_router.dart';

class LayoutScaffold extends StatelessWidget {
  const LayoutScaffold({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          animationDuration: const Duration(microseconds: 1),
          destinations: destinations
              .map(
                (Destination destination) => NavigationDestination(
                  icon: Icon(destination.icon),
                  label: "",
                  selectedIcon: Icon(
                    destination.selectIcon,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
              .toList(),
        ),
      );
}
