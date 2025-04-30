import 'package:flutter/material.dart';
import 'package:gdgs_mobile_app/util/router/routes.dart';
import 'package:gdgs_mobile_app/widget/layout/layout_scaffold.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/${AppRoute.home}',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => LayoutScaffold(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            homeRoutes,
          ],
        ),
        StatefulShellBranch(
          routes: [
            foodRecomendRoutes,
          ],
        ),
        StatefulShellBranch(
          routes: [
            foodHistoryRoutes,
          ],
        ),
        StatefulShellBranch(
          routes: [
            settingsRoutes,
          ],
        ),
      ],
    )
  ],
);
