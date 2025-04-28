import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/icons/navigation_icon_icons.dart';

class Destination {
  final String label;
  final IconData icon;
  final IconData selectIcon;

  const Destination(
      {required this.label, required this.icon, required this.selectIcon});
}

const List<Destination> destinations = [
  Destination(
    label: 'Home',
    icon: NavigationIcon.homeOutline,
    selectIcon: NavigationIcon.home,
  ),
  Destination(
    label: 'Food',
    icon: NavigationIcon.mapOutline,
    selectIcon: NavigationIcon.map,
  ),
  Destination(
    label: 'History',
    icon: NavigationIcon.heartOutline,
    selectIcon: NavigationIcon.heart,
  ),
  Destination(
    label: 'Settings',
    icon: NavigationIcon.settingsOutline,
    selectIcon: NavigationIcon.settings,
  ),
];
